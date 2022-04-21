import mongoose from 'mongoose';

let Partner = new mongoose.Schema({
    name: { type: String, required: true, unique: true },
    email: { type: String, required: true, unique: true },
    whatsapp: { type: String, required: true },
    business: { type: String, required: true },
    active: { type: Boolean, default: false }
}, { timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' }, versionKey: false });

export default mongoose.model('Partner', Partner, 'partner');