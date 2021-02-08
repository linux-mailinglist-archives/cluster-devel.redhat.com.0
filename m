Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE17312F64
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Feb 2021 11:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612781222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kcx04wUMOWLU3tXRf/qQCu6NFzG1U3xWcIoAWOM143A=;
	b=b3TEloq700cA7Kv4mQrXc6sds2xSECIlxTS1JD7yeRoxmdo87VgpiGRZQ5Ku27T5Za+doy
	gmZsx4JFQFxGYN/JMqr6FCU8wz+GMDR4cWrZK6CHHuDczQ1n4DPpRuB2ryo5a4pXBdiLJS
	6Bpudn+Ewm6VY7+MIWu/WWg/2DT1MJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-9rN2fFOOOxqSiT-VdTL2Cg-1; Mon, 08 Feb 2021 05:47:01 -0500
X-MC-Unique: 9rN2fFOOOxqSiT-VdTL2Cg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C261934110;
	Mon,  8 Feb 2021 10:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9221101E249;
	Mon,  8 Feb 2021 10:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAA864EA76;
	Mon,  8 Feb 2021 10:46:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 118AkkVU010594 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 05:46:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 486365DEFB; Mon,  8 Feb 2021 10:46:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6055D9E4;
	Mon,  8 Feb 2021 10:46:41 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <721726179.52142767.1612551041387.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <1b3385e1-93b2-a2b2-8dde-e8b90e779e94@redhat.com>
Date: Mon, 8 Feb 2021 10:46:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <721726179.52142767.1612551041387.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [gfs2 PATCH] gfs2: Don't skip dlm unlock if
 glock has an lvb
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

Longer term we should review whether this is really the correct fix. It 
seems a bit strange that we have to do something different according to 
whether there is an LVB or not. We are gradually increasing LVB use over 
time too. So should we fix the DLM so that either it can cope with locks 
with LVBs at lockspace shutdown time, or should we simply send an unlock 
for all DLM locks anyway? That would seem to make more sense than having 
two different systems depending on LVB existence, or otherwise,

Steve.

On 05/02/2021 18:50, Bob Peterson wrote:
> Patch fb6791d100d1bba20b5cdbc4912e1f7086ec60f8 was designed to allow
> gfs2 to unmount quicker by skipping the step where it tells dlm to
> unlock glocks in EX with lvbs. This was done because when gfs2 unmounts
> a file system, it destroys the dlm lockspace shortly after it destroys
> the glocks so it doesn't need to unlock them all: the unlock is implied
> when the lockspace is destroyed by dlm.
>
> However, that patch introduced a use-after-free in dlm: as part of its
> normal dlm_recoverd process, it can call ls_recovery to recover dead
> locks. In so doing, it can call recover_rsbs which calls recover_lvb for
> any mastered rsbs. Func recover_lvb runs through the list of lkbs queued
> to the given rsb (if the glock is cached but unlocked, it will still be
> queued to the lkb, but in NL--Unlocked--mode) and if it has an lvb,
> copies it to the rsb, thus trying to preserve the lkb. However, when
> gfs2 skips the dlm unlock step, it frees the glock and its lvb, which
> means dlm's function recover_lvb references the now freed lvb pointer,
> copying the freed lvb memory to the rsb.
>
> This patch changes the check in gdlm_put_lock so that it calls dlm_unlock
> for all glocks that contain an lvb pointer.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> Fixes: fb6791d100d1 "GFS2: skip dlm_unlock calls in unmount"
> ---
>   fs/gfs2/lock_dlm.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 9f2b5609f225..153272f82984 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -284,7 +284,6 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
>   {
>   	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
>   	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
> -	int lvb_needs_unlock = 0;
>   	int error;
>   
>   	if (gl->gl_lksb.sb_lkid == 0) {
> @@ -297,13 +296,10 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
>   	gfs2_sbstats_inc(gl, GFS2_LKS_DCOUNT);
>   	gfs2_update_request_times(gl);
>   
> -	/* don't want to skip dlm_unlock writing the lvb when lock is ex */
> -
> -	if (gl->gl_lksb.sb_lvbptr && (gl->gl_state == LM_ST_EXCLUSIVE))
> -		lvb_needs_unlock = 1;
> +	/* don't want to skip dlm_unlock writing the lvb when lock has one */
>   
>   	if (test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags) &&
> -	    !lvb_needs_unlock) {
> +	    !gl->gl_lksb.sb_lvbptr) {
>   		gfs2_glock_free(gl);
>   		return;
>   	}
>

