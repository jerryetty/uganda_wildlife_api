import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000/api/v1'; // Update with the correct base URL

export const fetchParks = async () => {
  const response = await axios.get(`${API_BASE_URL}/parks`);
  return response.data;
};

export const fetchActivities = async () => {
  const response = await axios.get(`${API_BASE_URL}/activities`);
  return response.data;
};

export const fetchBookings = async () => {
  const response = await axios.get(`${API_BASE_URL}/bookings`);
  return response.data;
};

export const fetchContacts = async () => {
  const response = await axios.get(`${API_BASE_URL}/contacts`);
  return response.data;
};
