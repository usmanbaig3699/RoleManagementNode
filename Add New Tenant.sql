begin;
--rollback;
-- Create tenant config
INSERT INTO public.tenant_config
(id, "name", "desc", created_by, updated_by, color1, color2, color3, logo, gst_percentage, email, min_order_amount, delivery_fee)
VALUES(uuid_generate_v4(), 'Theme - ${tenantName}', 'For ${tenantName} Description', (select id from backoffice_user bu where is_super_admin = true),
(select id from backoffice_user bu where is_super_admin = true), 'black', 'white', NULL, NULL, 10.0, NULL, NULL, NULL);
-- Select id from tenant_config tc where "name" = 'Theme - ${tenantName}';

-- Create tenant
INSERT INTO public.tenant
(id, "name", is_active, created_by, updated_by, tenant_config, "desc", parent)
VALUES(uuid_generate_v4(), '${tenantName}', true, (select id from backoffice_user bu where is_super_admin = true), 
(select id from backoffice_user bu where is_super_admin = true), (select id from tenant_config tc where "name" = 'Theme - ${tenantName}'),
NULL, NULL);
-- (Select id from tenant t where "name" = '${tenantName}');

-- Create User with Shop admin role
INSERT INTO public.backoffice_user
(id, username, "password", is_active, created_by, updated_by, email, is_super_admin, tenant, first_name, last_name, "role")
VALUES(uuid_generate_v4(), '${shopAdmin}', '$2a$10$KXyHlk8EguZNFmsH7T.sS.wcWATHXidXojJjT.Dqhh5hj4izR1JDq', true, NULL, NULL, '${shopAdmin}', false, (Select id from tenant t where "name" = '${tenantName}'), '${firstName}', '${lastName}', NULL);
-- select id from backoffice_user bu where bu.username = '${shopAdmin}'; 
-- select * from backoffice_user bu where bu.username = '${shopAdmin}'; -- Password is 123
-- usrname = shopadmin06@urapptech.com ,password = 123
-- Create home menu
INSERT INTO public.home_category
(id, "name", "desc", icon, banner, created_by, updated_by, tenant, is_active, is_deleted)
VALUES(uuid_generate_v4(), 'Commercial', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/1d6f0e45-37c1-4975-af97-2bdeafdb4d6b-Commercial.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/f089ac10-aff9-40c9-a7e8-5493007d1ca6-Commercial.png', (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Iron', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/58b7a298-76c1-498e-b839-b5cd6a91afba-iron.png', NULL, (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Business Laundry', 'Business Laundry', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/527c3d48-4237-442b-afa9-f7f8ae1f949e-Commercial.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/527c3d48-4237-442b-afa9-f7f8ae1f949e-Commercial.png', (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Self Service Laundry', 'DIY laundry with washers & dryers for customers.', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/0b4f0267-4e36-4519-8042-d7fdecde5ede-dry%20cleaning.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/e362cd5f-ff65-4c71-8ad0-a619cbdf76a2-dry%20cleaning.png', (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Dry Clean', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/3f47d17f-4607-476a-9fed-53449907ca25-dry%20cleaning.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/3f47d17f-4607-476a-9fed-53449907ca25-dry%20cleaning.png', (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Wash & Fold', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/d28719bd-bb79-413a-b0fc-d573318db8c1-machine%201%20%282%29.png', NULL, (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Home', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/6030dc2d-ce43-47be-bf72-5be94f8e4256-homee.png', NULL, (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false),
(uuid_generate_v4(), 'Outdoor Wear', 'this is ponchos', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/2470b2bd-f2a2-4e17-8b1c-4b4eba109d02-out%20door%20wear.png', NULL, (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (Select id from tenant t where "name" = '${tenantName}'), true, false);
-- ids
select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Business Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Self Service Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}');
select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}');
-- create sub menu
INSERT INTO public.home_cat_item
(id, "name", icon, banner, "desc", price, is_active, home_category, created_by, updated_by, quantity, is_deleted)
VALUES(uuid_generate_v4(), 'Printed Tshirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/icon/printed-tshirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/printed-tshirt.png', 'this is  printed tshirt', 15.67, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'White Fairy Blouse', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/icon/white-fairy-blouse.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/white-fairy-blouse.png', 'this is white fairy blouse', 18.90, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Jacket', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/jacket.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/jacket.png', 'this is jacket', 11.23, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Jeans', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/jeans.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/jeans.png', 'this is jeans', 16.78, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Shirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/shirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/shirt.png', 'this is shirt', 17.89, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Scarf', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/scarf.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/scarf.png', 'this is scarf', 10.12, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Frock', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/frock.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/frock.png', 'this is frocks', 13.45, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Wastern Shirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/wastern-shirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/wastern-shirt.png', 'this is western shirt', 19.01, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Blazer Suit', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/blazer-suit.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/blazer-suit.png', 'this is blazer suit', 12.34, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Dress Pant', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/dress-pant.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/dress-pant.png', 'this is dress pant', 15.67, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Sky Shirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/sky-shirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/sky-shirt.png', 'this is sky shirt', 18.90, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Long Skirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/long-skirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/long-skirt.png', 'this is long skirt', 14.56, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Overcoat', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/overcoat.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/overcoat.png', 'this is overcoat', 17.89, true, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Ultralight Rain Skirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/ultralight-rain-skirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/ultralight-rain-skirt.png', 'this is ultralight rain skirt', 16.78, true, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'V-Neck Tshirt', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/icon/v-neck-tshirt.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/iron/banner/v-neck-tshirt.png', 'this is vnect tshirt', 11.23, false, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Dress Pants', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/icon/dress-pants.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/wash-fold/banner/dress-pants.png', 'this is dress pants', 14.56, true, (select id from public.home_category hc where "name" = 'Wash & Fold' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Rain Slicker', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/rain-slicker.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/rain-slicker.png', 'this is rain slicker', 10.12, false, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Towel', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/icon/towel.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/towel.png', 'this is towel', 11.23, false, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, true)
,(uuid_generate_v4(), 'Seven Star Jacket', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/icon/seven-star-jacket.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/seven-star-jacket.png', 'this is seven star jacker', 13.45, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Trench Coat', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/trench-coat.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/trench-coat.png', 'this is trench coat', 12.34, true, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Bedsheet', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/170df77e-9d70-4ea8-9fab-f9d80ddb0215-bed%20blanket.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/bedsheet.png', 'this is bedsheet', 18.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Hospital Curtains', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/icon/hospital-curtain.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/hospital-curtain.png', 'this is hospital curtains', 16.78, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Pillow Case', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/icon/pillow-case.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/pillow-case.png', 'this is pillow case', 19.01, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Hospital Bedsheet', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/icon/hospital-bedsheet.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/hospital-bedsheet.png', 'this is hospital bedsheet', 12.34, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Bed Blanket', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/icon/bed-blanket.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/bed-blanket.png', 'this is bed blanket', 15.67, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Napkins', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/icon/napkins.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/napkins.png', 'this is napkins', 18.90, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Curtains', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/icon/curtains.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/curtains.png', 'this is curtains', 14.56, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Hotel Towel', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/778b8b12-598f-4e33-a0e5-bcd4742ea4df-Ellipse%2016.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/commercial/banner/hotel-towel.png', 'this is hotel towel', 15.67, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Carpet', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/icon/carpet.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/carpet.png', 'this is carpet', 10.12, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Mat', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/icon/mat.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/mat.png', 'This is Mat', 14.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Baseball Jacket', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/icon/baseball-jacket.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/baseball-jacket.png', 'this is baseball jacket', 19.01, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Grey Neck Scarf', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/icon/neck-scarf.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/neck-scarf.png', 'this is  gray nect scarf', 12.34, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Mackintosh', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/mckintosh.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/mckintosh.png', 'this is mackintosh', 15.67, true, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Rug', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/b344a553-cc06-46c7-b912-69446255fa17-rug.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/home/banner/rug.png', 'This is Rug', 16.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Pants', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/6f11a2d5-8d3a-46ac-92c3-19c2258a2028-pants.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/dry-cleaning/banner/pants.png', 'this is pants', 13.00, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Ponchos', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/icon/ponchos.png', 'https://laundry-app.s3.ca-central-1.amazonaws.com/619943ef-8e9f-4a74-9e1e-4b299d19330d/theme/sub_menu/outdoor-wear/banner/ponchos.png', 'this is ponchos', 19.01, true, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Jecket', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/223cf5f2-884d-4236-9e31-ce67b5bce0c9-Ellipse%2016.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/223cf5f2-884d-4236-9e31-ce67b5bce0c9-Ellipse%2016.png', 'This is Jacket', 20.00, true, (select id from public.home_category hc where "name" = 'Self Service Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Business Wears', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/b5cf94e5-dd7f-4324-a196-3ef65150c132-basket_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/2394a219-0e20-4b82-83b1-7efa45e19568-basket_720.png', 'Business Wears', 10.00, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Cloths', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/fc4055a7-c788-48a1-bcf9-3d824528ca11-Ellipse%2016.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/d7d457d7-3276-4579-90e2-f2cc646cbc3f-basket_720.png', 'These are Cloths', 11.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 1, false)
,(uuid_generate_v4(), 'Whole Neck T-Shirt', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/81b5053f-b6f0-4b95-941a-24f838f42c5f-cloth.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/81b5053f-b6f0-4b95-941a-24f838f42c5f-cloth.png', 'Test Desc', 6.00, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 3, false)
,(uuid_generate_v4(), 'Painted Shirt', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/87592585-cfd9-48a4-b529-5ceca09f0a9d-cloth.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/87592585-cfd9-48a4-b529-5ceca09f0a9d-cloth.png', 'this is ponchos', 7.00, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Neck T-Shirt', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/2e0040b7-2b50-4db4-a1cd-e7a9153792d9-cloth.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/2e0040b7-2b50-4db4-a1cd-e7a9153792d9-cloth.png', 'this is ponchos', 7.00, true, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 3, false)
,(uuid_generate_v4(), 'Blankets', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/625f61d0-24a8-441a-bccf-c18e2665251f-bed%20blanket.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/19f99f00-73b7-45ad-94c8-6cec36c38bf9-bed%20blanket.png', 'Blankets', 8.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 3, false)
,(uuid_generate_v4(), 'H-Neck', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/4a78302a-0f77-4025-935e-713e1e3527c6-sweater_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/4a78302a-0f77-4025-935e-713e1e3527c6-sweater_720.png', 'This is H-Neck', 16.00, true, (select id from public.home_category hc where "name" = 'Self Service Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Sweater', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/ac0d4292-c01f-4f90-bd9f-2416f473b4c6-sweater_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/ac0d4292-c01f-4f90-bd9f-2416f473b4c6-sweater_720.png', 'Sweater', 7.00, true, (select id from public.home_category hc where "name" = 'Dry Clean' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Business Cloths', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/fc43210b-633e-4702-a77c-184e4289d561-basket_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/fc43210b-633e-4702-a77c-184e4289d561-basket_720.png', 'Cloths', 12.00, true, (select id from public.home_category hc where "name" = 'Commercial' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 1, false)
,(uuid_generate_v4(), 'Trousers', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/8f9b5efe-da59-419a-ac21-a06bfd3c47c7-pants.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/8f9b5efe-da59-419a-ac21-a06bfd3c47c7-pants.png', 'This is Trouser', 11.00, true, (select id from public.home_category hc where "name" = 'Business Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'T-Shirt', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/c4ae7d61-3898-456e-a1cc-15fcf310becc-Ellipse%2016.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/c4ae7d61-3898-456e-a1cc-15fcf310becc-Ellipse%2016.png', 'This is T-Shirt', 11.00, true, (select id from public.home_category hc where "name" = 'Home' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 1, false)
,(uuid_generate_v4(), 'Sweaters', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/0b1dc76f-9b55-4385-bac0-22d0b988313a-sweater_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/0b1dc76f-9b55-4385-bac0-22d0b988313a-sweater_720.png', 'This is sweater', 10.00, false, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 2, false)
,(uuid_generate_v4(), 'Skirt', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/991de269-f943-4ccc-a032-319bbf7c2d58-sweater_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/991de269-f943-4ccc-a032-319bbf7c2d58-sweater_720.png', 'This is Skirt', 7.00, false, (select id from public.home_category hc where "name" = 'Iron' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 0, false)
,(uuid_generate_v4(), 'Coat', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/fc5d9743-341d-4755-9d05-7364e2ae0361-sweater_720.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/fc5d9743-341d-4755-9d05-7364e2ae0361-sweater_720.png', 'Coats', 12.00, false, (select id from public.home_category hc where "name" = 'Outdoor Wear' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 1, false)
,(uuid_generate_v4(), 'Shirts', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/37e1669b-b7e6-4b5c-b0fb-530b67c1ff81-Ellipse%2016.png', 'https://lundry-app-admin.s3.ca-central-1.amazonaws.com/menu/37e1669b-b7e6-4b5c-b0fb-530b67c1ff81-Ellipse%2016.png', 'This is Shirt', 7.00, false, (select id from public.home_category hc where "name" = 'Self Service Laundry' and tenant = (Select id from tenant t where "name" = '${tenantName}')), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), (select id from backoffice_user bu where bu.username = '${shopAdmin}'), 1, true);
commit;