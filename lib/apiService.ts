import axios from 'axios';

const API_BASE_URL = 'http://localhost:4140/api/v1';

// TypeScript interfaces for API responses
export interface Park {
  id: number;
  name: string;
  entrance_fee_foreign: number;
  entrance_fee_local: number;
  description?: string;
  created_at: string;
  updated_at: string;
}

export interface Activity {
  id: number;
  name: string;
  price_foreign: number;
  price_local: number;
  duration_hours: number;
  park_id: number;
  description?: string;
  max_participants?: number;
  created_at: string;
  updated_at: string;
}

export interface Booking {
  id: number;
  visitor_name: string;
  email: string;
  phone: string;
  visit_date: string;
  number_of_visitors: number;
  status: string;
  activity_id: number;
  user_id?: number;
  created_at: string;
  updated_at: string;
}

export interface ContactFormData {
  name: string;
  email: string;
  message: string;
}

// Parks API
export const fetchParks = async (): Promise<Park[]> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/parks`);
    return response.data;
  } catch (error) {
    console.error('Error fetching parks:', error);
    throw error;
  }
};

export const fetchPark = async (id: number): Promise<Park> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/parks/${id}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching park ${id}:`, error);
    throw error;
  }
};

export const fetchParkActivities = async (parkId: number): Promise<Activity[]> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/parks/${parkId}/activities`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching activities for park ${parkId}:`, error);
    throw error;
  }
};

// Activities API
export const fetchActivities = async (parkId?: number): Promise<Activity[]> => {
  try {
    const url = parkId 
      ? `${API_BASE_URL}/activities?park_id=${parkId}`
      : `${API_BASE_URL}/activities`;
    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    console.error('Error fetching activities:', error);
    throw error;
  }
};

export const fetchActivity = async (id: number): Promise<Activity> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/activities/${id}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching activity ${id}:`, error);
    throw error;
  }
};

// Bookings API
export const fetchBookings = async (): Promise<Booking[]> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/bookings`);
    return response.data;
  } catch (error) {
    console.error('Error fetching bookings:', error);
    throw error;
  }
};

export const fetchBooking = async (id: number): Promise<Booking> => {
  try {
    const response = await axios.get(`${API_BASE_URL}/bookings/${id}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching booking ${id}:`, error);
    throw error;
  }
};

export const createBooking = async (activityId: number, bookingData: Omit<Booking, 'id' | 'created_at' | 'updated_at'>): Promise<Booking> => {
  try {
    const response = await axios.post(`${API_BASE_URL}/activities/${activityId}/bookings`, {
      booking: bookingData
    });
    return response.data;
  } catch (error) {
    console.error('Error creating booking:', error);
    throw error;
  }
};

// Contacts API
export const submitContactForm = async (contactData: ContactFormData): Promise<{ message: string }> => {
  try {
    const response = await axios.post(`${API_BASE_URL}/contact`, {
      contact: contactData
    });
    return response.data;
  } catch (error) {
    console.error('Error submitting contact form:', error);
    throw error;
  }
};
