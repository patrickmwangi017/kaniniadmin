@extends('layouts.app')



@section('content')

<div class="col-md-16">
    <form action="{{URL::to('/searchaccountantspayments')}}" method="POST" role="search">
    {{csrf_field()}}
    <div class="input-group">
        <input type="search" name="searchaccountantspayments" class="form-control" placeholder="search payment by name, address or status">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-default">
            <span class="glyphicon-search"></span></button>
        </span>
    </div>

</form>
</div>


<!-- <div class="table-responsive"> -->
<table class="table">
<thead class="text-primary">
<th>Date Of Booking</th>
<th>Booked Services</th>
<th>Booking Status</th>

</thead>
<tbody>
@foreach ($shipments as $row )
@if($row->order_shipment == "Shipment" && $row->booking_status == "Pending")
<tr>
<td>{{$row->created_at}}</td>
<td>
<div class="panel panel-default">
<div class="panel-body">
<ul class="list-group">
@foreach($row->booking->items as $item)
<li class="list-group-item">
 <span class="badge"> {{$item['price']}} </span> 
 {{ $item['item']['serviceName']}}  <br>  {{$item['qty']}} Units
 </li>
@endforeach
</ul>
</div>
<div class="panel-footer">
<strong>Total Price: {{$row->booking->totalPrice}}</strong>
</div>
</div>
</td>
<td>@if($row->booking_status == "Pending") Pending 
@elseif($row->booking_status == "Approved") Approved
@elseif($row->booking_status == "Rejected") Rejected
 @endif</td>
</tr>
@endif
@endforeach
</tbody>
</table>
</div>
@endsection
