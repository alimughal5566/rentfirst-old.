<?php
// Keywords
$keywords = rawurldecode(request()->get('q'));

// Category
$qCategory = (isset($cat) and !empty($cat)) ? $cat->tid : request()->get('c');

// Location
if (isset($city) and !empty($city)) {
    $qLocationId = (isset($city->id)) ? $city->id : 0;
    $qLocation = $city->name;
    $qAdmin = request()->get('r');
} else {
    $qLocationId = request()->get('l');
    $qLocation = (request()->filled('r')) ? t('area:') . rawurldecode(request()->get('r')) : request()->get('location');
    $qAdmin = request()->get('r');
}
?>
<div class="container">
    <div class="search-row-wrapper">
        <div class="container">
            <?php $attr = ['countryCode' => config('country.icode')]; ?>
            <form id="seach" name="search" action="{{ lurl(trans('routes.v-search', $attr), $attr) }}" method="GET">
                <div class="row m-0 d-flex justify-content-around">

                    <div class="col-md-2 col-xs-12  search-col  search-cat">
                        <div class="px-2 w-100 position-relative d-flex align-items-center">
                            <select name="c" id="catSearch" class="form-control selecter">
                                <option value="" {{ ($qCategory=='') ? 'selected="selected"' : '' }}> {{ t('All Categories') }} </option>
                                @if (isset($cats) and $cats->count() > 0)
                                    @foreach ($cats->groupBy('parent_id')->get(0) as $itemCat)
                                        <option {{ ($qCategory==$itemCat->tid) ? ' selected="selected"' : '' }} value="{{ $itemCat->tid }}"> {{ $itemCat->name }} </option>
                                    @endforeach
                                @endif
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4 col-xs-12 search-col  locationicon  search-location">
                        <div class="px-2 w-100 position-relative d-flex align-items-center">
                            <i class="far fa-map-marker-alt"></i>
                            <input type="text" id="locSearch" name="location"
                                   class="form-control locinput input-rel searchtag-input has-icon tooltipHere"
                                   placeholder="{{ t('Where?') }}" value="{{ $qLocation }}" title=""
                                   data-placement="bottom"
                                   data-toggle="tooltip"
                                   data-original-title="{{ t('Enter a city name OR a state name with the prefix ":prefix" like: :prefix', ['prefix' => t('area:')]) . t('State Name') }}">
                        </div>
                    </div>

                    <div class="col-md-4 col-xs-12 search-col search-keyword">
                        <div class="px-2 w-100 position-relative d-flex align-items-center">
                            <i class="far fa-search"></i>
                            <input name="q" class="form-control keyword" type="text" placeholder="{{ t('What?') }}"
                                   value="{{ $keywords }}">
                        </div>
                    </div>

                    <input type="hidden" id="lSearch" name="l" value="{{ $qLocationId }}">
                    <input type="hidden" id="rSearch" name="r" value="{{ $qAdmin }}">

                    <div class="col-md-2 col-xs-12 search-col search-button">
                        <div class="px-2 w-100 position-relative d-flex align-items-center">
                            <button class="btn btn-primary btn-search d-flex align-items-center justify-content-center">
                                {{--                            <i class="fa fa-search"></i> --}}
                                <strong>{{ t('Find') }}</strong>
                            </button>
                        </div>
                    </div>

                    {!! csrf_field() !!}
                </div>
            </form>
        </div>
    </div>
</div>

@section('after_scripts')
    @parent
    <script>
        $(document).ready(function () {
            $('#locSearch').on('change', function () {
                if ($(this).val() == '') {
                    $('#lSearch').val('');
                    $('#rSearch').val('');
                }
            });
        });
    </script>
@endsection
