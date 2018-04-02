create view view_reports as
  SELECT clients.id,
    clients.date_of_referral,
    clients.date_received,
    clients.case_type,
    clients.firstname,
    clients.lastname,
    clients.dob,
    clients.ssn,
    clients.phone,
    clients.phone_ext,
    clients.alt_phone,
    clients.address,
    clients.address1,
    clients.address2,
    clients.city,
    clients.zipcode,
    clients.doi,
    clients.body_parts,
    clients.other_ibp,
    clients.is_doctor_mpn,
    clients.employer_name,
    clients.attorney_notes,
    clients.scheduled_with,
    clients.appt_date,
    clients.date_moved,
    clients.clinic_notes,
    clients.insurance_notes,
    clients.patient_treating,
    clients.next_appt,
    clients.verified_with,
    clients.first_seen,
    clients.created_at,
    clients.updated_at,
    clients.created_by,
    clients.updated_by,
    clients.appt_reason_cancel_id,
    clients.appt_confirmed_id,
    clients.referral_source_id,
    clients.clinic_id,
    clients.insurance_company_id,
    clients.attorney_id,
    clients.doctor_id,
    CASE
    WHEN clinics.name IS NULL THEN NULL::text
    WHEN clinics.name IS NOT NULL THEN concat(clinics.name, ', ', clinics.address1, ', ', clinics.city, ' CA, ', clinics.zipcode)
    ELSE NULL::text
    END AS clinic_name,
    clinics.address1 AS clinic_address1,
    clinics.address2 AS clinic_address2,
    clinics.city AS clinic_city,
    doctors.name AS doctor_name,
    attorneys.name AS attorney_name,
    lawoffices.name AS lawoffice_name,
    insurances.name AS insurance_name,
    confirmations.name AS confirmed,
    cancellations.name AS cancelled,
    creating.name AS "createdBy",
    updating.name AS "updatedBy"
  FROM clients
    JOIN attorneys_doctors attorneys ON attorneys.id = clients.attorney_id
    LEFT JOIN requesting_offices lawoffices ON lawoffices.id = clients.referral_source_id
    LEFT JOIN requesting_offices clinics ON clinics.id = clients.clinic_id
    LEFT JOIN requesting_offices insurances ON insurances.id = clients.insurance_company_id
    LEFT JOIN attorneys_doctors doctors ON doctors.id = clients.doctor_id
    LEFT JOIN reasons confirmations ON confirmations.id = clients.appt_confirmed_id
    LEFT JOIN reasons cancellations ON cancellations.id = clients.appt_reason_cancel_id
    LEFT JOIN users creating ON creating.id = clients.created_by
    LEFT JOIN users updating ON updating.id = clients.updated_by;