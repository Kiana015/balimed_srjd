<?php

namespace App\Notifications;

use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class OTPNotification extends Notification
{
    use Queueable;

    protected $otpToken;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($otpToken)
    {
        $this->otpToken = $otpToken;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $user = User::where('id',$this->otpToken->user_id)->first();
        return (new MailMessage)
                    ->greeting("Hi, ",$user->name)
                    ->line("Kode OTP digunakan untuk verifikasi akun anda.")
                    ->line("<h1><strong>{$this->otpToken->otp_token}</strong></hi>")
                    ->line("Terimakasih");
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
