<?php

namespace App\Plugins\watermark;

use App\Helpers\DBTool;
use App\Models\Setting;
use App\Helpers\Payment;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Prologue\Alerts\Facades\Alert;

class Watermark extends Payment
{
	/**
	 * @param $image
	 * @return null
	 */
	public static function apply($image)
	{
		// Insert watermark at bottom-right corner with 10px offset
		try {
			$watermark = config('settings.watermark.watermark');
			if (!empty($watermark) and Storage::exists($watermark)) {
				$image->insert(
					Storage::get($watermark),
					config('settings.watermark.position', config('watermark.position')),
					(int)config('settings.watermark.position_x', config('watermark.position_x')),
					(int)config('settings.watermark.position_y', config('watermark.position_y'))
				);
			}
		} catch (\Exception $e) {
			return null;
		}
		
		return $image;
	}
	
	/**
	 * @param $value
	 * @param $setting
	 * @return bool
	 */
	public static function setWatermarkValue($value, $setting)
	{
		// Get size parameters in live
		Config::set('settings.watermark.width', (isset($value['width'])) ? (int)$value['width'] : (int)config('watermark.width', 150));
		Config::set('settings.watermark.height', (isset($value['height'])) ? (int)$value['height'] : (int)config('watermark.height', 150));
		
		$attribute_name = 'watermark';
		$destination_path = 'app/logo';
		
		// If 'watermark' value doesn't exist, don't make the upload and save data
		if (!isset($value[$attribute_name])) {
			return $value;
		}
		
		// If the image was erased
		if (empty($value[$attribute_name])) {
			// Delete the image from disk
			if (isset($setting->value) && isset($setting->value[$attribute_name])) {
				Storage::delete($setting->value[$attribute_name]);
			}
			
			// Set null in the database column
			$value[$attribute_name] = null;
			
			return $value;
		}
		
		// If a base64 was sent, store it in the db
		if (fileIsUploaded($value[$attribute_name])) {
			try {
				// Get file extension
				$extension = getUploadedFileExtension($value[$attribute_name]);
				if (empty($extension)) {
					$extension = 'jpg';
				}
				
				// Make the image (Size: 150x150)
				$image = Image::make($value[$attribute_name])->resize(config('settings.watermark.width'), config('settings.watermark.height'), function ($constraint) {
						$constraint->aspectRatio();
						$constraint->upsize();
					})->encode('png', (int)config('larapen.core.picture.quality', 100));
			} catch (\Exception $e) {
				Alert::error($e->getMessage())->flash();
				
				$value[$attribute_name] = null;
				
				return $value;
			}
			
			// Generate a filename.
			$filename = uniqid('watermark-') . '.' . $extension;
			
			// Store the image on disk.
			Storage::put($destination_path . '/' . $filename, $image->stream());
			
			// Save the path to the database
			$value[$attribute_name] = $destination_path . '/' . $filename;
		} else {
			// Retrieve current value without upload a new file.
			if (!starts_with($value[$attribute_name], $destination_path . '/')) {
				$value[$attribute_name] = $destination_path . last(explode($destination_path, $value[$attribute_name]));
			}
			
			// Get, Transform and Save the path to the database
			if (!Storage::exists($value[$attribute_name])) {
				$value[$attribute_name] = null;
			} else {
				$value[$attribute_name] = $destination_path . last(explode($destination_path, $value[$attribute_name]));
			}
		}
		
		return $value;
	}
	
	/**
	 * @return array
	 */
	public static function getOptions()
	{
		$options = [];
		$setting = Setting::active()->where('key', 'watermark')->first();
		if (!empty($setting)) {
			$options[] = (object)[
				'name'     => mb_ucfirst(trans('admin::messages.settings')),
				'url'      => admin_url('settings/' . $setting->id . '/edit'),
				'btnClass' => 'btn-info',
			];
		}
		
		return $options;
	}
	
	/**
	 * @return bool
	 */
	public static function installed()
	{
		$setting = Setting::active()->where('key', 'watermark')->first();
		if (!empty($setting)) {
			return File::exists(plugin_path('watermark', 'installed'));
		}
		
		return false;
	}
	
	/**
	 * @return bool
	 */
	public static function install()
	{
		// Remove the plugin entry
		self::uninstall();
		
		try {
			// Create plugin setting
			DB::statement('ALTER TABLE ' . DBTool::table('settings') . ' AUTO_INCREMENT = 1;');
			$pluginSetting = [
				'key'         => 'watermark',
				'name'        => 'Watermark',
				//'value'     => null,
				'description' => 'Watermark for Ads Pictures',
				'field'       => null,
				'parent_id'   => 0,
				'lft'         => 32,
				'rgt'         => 33,
				'depth'       => 1,
				'active'      => 1,
			];
			$setting = Setting::create($pluginSetting);
			if (empty($setting)) {
				return false;
			}
			
			// Create plugin Installed file
			File::put(plugin_path('watermark', 'installed'), '');
			
			return true;
		} catch (\Exception $e) {
			Alert::error($e->getMessage())->flash();
		}
		
		return false;
	}
	
	/**
	 * @return bool
	 */
	public static function uninstall()
	{
		try {
			// Remove the plugin setting
			$setting = Setting::where('key', 'watermark')->first();
			if (!empty($setting)) {
				$setting->delete();
			}
			
			// Remove plugin Installed file
			File::delete(plugin_path('watermark', 'installed'));
			
			return true;
		} catch (\Exception $e) {
			Alert::error($e->getMessage())->flash();
		}
		
		return false;
	}
	
	/**
	 * @return string
	 */
	public static function getFieldData()
	{
		$value = '{"name":"file_sep","type":"custom_html","value":"' . cleanAddSlashes(trans('watermark::messages.file_h3'), '"') . '","disableTrans":"true"},
{"name":"watermark","label":"' . cleanAddSlashes(trans('watermark::messages.watermark_label')) . '","type":"image","upload":true,"disk":"public","default":"","hint":"' . cleanAddSlashes(trans('watermark::messages.watermark_hint')) . '","wrapperAttributes":{"class":"form-group col-md-6"},"plugin":"watermark","disableTrans":"true"},
{"name":"separator_clear_1","type":"custom_html","value":"<div style=\"clear: both;\"></div>"},
{"name":"file_info","type":"custom_html","value":"' . cleanAddSlashes(trans('watermark::messages.file_info'), '"') . '","disableTrans":"true"},
{"name":"width","label":"' . cleanAddSlashes(trans('watermark::messages.width_label'), '"') . '","type":"text","hint":"' . cleanAddSlashes(trans('watermark::messages.width_hint')) . '","wrapperAttributes":{"class":"form-group col-md-6"},"disableTrans":"true"},
{"name":"height","label":"' . cleanAddSlashes(trans('watermark::messages.height_label'), '"') . '","type":"text","hint":"' . cleanAddSlashes(trans('watermark::messages.height_hint')) . '","wrapperAttributes":{"class":"form-group col-md-6"},"disableTrans":"true"},

{"name":"position_sep","type":"custom_html","value":"' . cleanAddSlashes(trans('watermark::messages.position_h3'), '"') . '","disableTrans":"true"},
{"name":"position_info","type":"custom_html","value":"' . cleanAddSlashes(trans('watermark::messages.position_info'), '"') . '","disableTrans":"true"},
{"name":"position","label":"' . cleanAddSlashes(trans('watermark::messages.position_label'), '"') . '","type":"select_from_array","options":{"top-left":"' . cleanAddSlashes(trans('watermark::messages.op_top_left'), '"') . '","top":"' . cleanAddSlashes(trans('watermark::messages.op_top'), '"') . '","top-right":"' . cleanAddSlashes(trans('watermark::messages.op_top_right'), '"') . '","left":"' . cleanAddSlashes(trans('watermark::messages.op_left'), '"') . '","center":"' . cleanAddSlashes(trans('watermark::messages.op_center'), '"') . '","right":"' . cleanAddSlashes(trans('watermark::messages.op_right'), '"') . '","bottom-left":"' . cleanAddSlashes(trans('watermark::messages.op_bottom_left'), '"') . '","bottom":"' . cleanAddSlashes(trans('watermark::messages.op_bottom'), '"') . '","bottom-right":"' . cleanAddSlashes(trans('watermark::messages.op_bottom_right'), '"') . '"},"wrapperAttributes":{"class":"form-group col-md-6"},"disableTrans":"true"},
{"name":"position_x","label":"' . cleanAddSlashes(trans('watermark::messages.position_x_label'), '"') . '","type":"text","hint":"' . cleanAddSlashes(trans('watermark::messages.position_x_hint')) . '","wrapperAttributes":{"class":"form-group col-md-3"},"disableTrans":"true"},
{"name":"position_y","label":"' . cleanAddSlashes(trans('watermark::messages.position_y_label'), '"') . '","type":"text","hint":"' . cleanAddSlashes(trans('watermark::messages.position_y_hint')) . '","wrapperAttributes":{"class":"form-group col-md-3"},"disableTrans":"true"}';
		
		return $value;
	}
}
