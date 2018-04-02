alter table regions add column deleted_at TIMESTAMP(0);
alter table reasons add column deleted_at timestamp(0);
alter table requesting_offices add column deleted_at timestamp(0);
alter table attorneys_doctors add column deleted_at timestamp(0);
alter table users add column deleted_at timestamp(0);
alter table sessions add column checkin timestamp(0);
