/*
  # Add Room Number Column to Prescriptions Table

  1. Schema Changes
    - Add `room_number` column to prescriptions table if it doesn't exist
    - Ensure the column is properly configured as nullable TEXT

  2. Security
    - No changes to existing RLS policies needed
*/

-- Add room_number column to prescriptions table if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'prescriptions' AND column_name = 'room_number'
  ) THEN
    ALTER TABLE public.prescriptions 
    ADD COLUMN room_number TEXT;
  END IF;
END $$;

-- Add comment for documentation
COMMENT ON COLUMN public.prescriptions.room_number IS 'Patient room number or ward designation';