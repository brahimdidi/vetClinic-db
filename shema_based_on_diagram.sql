CREATE TABLE patients (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);
CREATE TABLE medical_histories (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id BIGINT NOT NULL REFERENCES patients(id),
  status VARCHAR(100)
);

CREATE TABLE invoices (
  id BIGSERIAL NOT NULL  PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id BIGINT NOT NULL UNIQUE REFERENCES medical_histories
);
CREATE TABLE invoices_items (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id BIGINT NOT NULL REFERENCES invoices(id),
  treatment_id BIGINT NOT NULL REFERENCES treatments(id)
);
CREATE TABLE treatments (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100)
);
CREATE TABLE medical_histories_treatments (
 medical_histories_id BIGINT REFERENCES medical_histories(id),
 treatments_id BIGINT REFERENCES treatments (id)
 );

 CREATE INDEX medical_histories_patients_id_idx ON medical_histories(patient_id);
 CREATE INDEX invoices_medical_histories_id_idx ON invoices(medical_histories_id);
 CREATE INDEX invoices_items_invoice_id_idx ON invoices_items(invoice_id);
 CREATE INDEX invoices_items_treatment_id_idx ON invoices_items(treatment_id);
 CREATE INDEX medical_histories_treatments_medical_histories_id_idx ON medical_histories_treatments(medical_histories_id);
 CREATE INDEX medical_histories_treatments_treatments_id_idx ON medical_histories_treatments(treatments_id);
 
