--Warehouse Wise PO Placed Count

select w.id WarehouseID,
       w.name Warehouse,
	   count(distinct po.vendorid) VendorCount,
	   count(distinct po.id) POCount

from purchaseorder po
join thing t on po.Id = t.purchaseOrderId
join warehouse w on w.id=po.sourcingwarehouseid

where po.CreatedOn >= concat(CAST(GETDATE() as date), ' 00:00  +06:00')
and po.CreatedOn < concat(CAST(GETDATE()+1 as date), ' 00:00  +06:00')
and po.PurchaseOrderStatusId not in (3)
and po.SourcingWarehouseId in (13,28,30,32)
and w.DistributionNetworkId = 1

group by w.id,
         w.name

order by 1 asc