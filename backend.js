// backend.js - Supabase Database Connection Layer
const SUPABASE_URL = 'https://jcwxgryviomkpetyaujx.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_n0auQyx2p26HQ9FUEiLNzQ_d5ML6fM-';
let supabaseClient = null;

// Initialize Supabase if the library is loaded
if (typeof window.supabase !== 'undefined') {
    supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
}
