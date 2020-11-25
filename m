Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6EAF2C46DD
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Nov 2020 18:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606325690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Xh13Ia0f/u3nPXHtf6+59AS6/VsucDSVgnx3iLAfl9g=;
	b=EiweWHr/cFUJx7AVTjhrHs71Wy9hZAFn8/62KsL1VeZjxa0ah9ahzh+Mp0cxTNknLFuNLA
	ZWGNhcxTZk83mUiak6AQKvAPdcmfL+rnZtYbaWeIewZ1bVKijsefCwqgy15+jzUOeop/h7
	C1ZtvxpGZsPdn2xavrDBpaJDGkv8szk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-U3ucffzbMMytZI1SQnpHcw-1; Wed, 25 Nov 2020 12:34:49 -0500
X-MC-Unique: U3ucffzbMMytZI1SQnpHcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC863102CB76;
	Wed, 25 Nov 2020 17:34:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836FD60C0F;
	Wed, 25 Nov 2020 17:34:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5E471809C9F;
	Wed, 25 Nov 2020 17:34:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APHYZa1013832 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 12:34:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A8D6C112D189; Wed, 25 Nov 2020 17:34:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4115112D183
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:34:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A26E858287
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 17:34:33 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-hUADRg-lOjethmJdlKlEnA-1; Wed, 25 Nov 2020 12:34:31 -0500
X-MC-Unique: hUADRg-lOjethmJdlKlEnA-1
Received: by mail-wm1-f70.google.com with SMTP id e15so608208wme.4
	for <cluster-devel@redhat.com>; Wed, 25 Nov 2020 09:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xh13Ia0f/u3nPXHtf6+59AS6/VsucDSVgnx3iLAfl9g=;
	b=JpQ/+IpTSAoJAamfDP8AXs5bTxbc643I/IkZn4hTfIrysMq0dNBhXuPfd3PtNaao74
	RlCysJ/pmu9je9etmomWGRPZMwCsmWZRTMN5uwE3U+4inyBwANm59TFOmK8GSIZuICbL
	Tpu90/Nfmd6848nwprdOonZOsS2ekMEiBHTJaBWLBgBIld+tlOPA41LekGkPn4wc+cY9
	twvWE24KZQt8/B2eHwT66FTP5WK6LvkRwGn3AQgZhI6yRP6gg0fKWd22cyjYksIGUTpi
	5APZQimbce6mLvoRNHy5u+lNbcUr9qhqPixVH7ElxWxRpo/yUaVgHDsnSYQjm04ZYSSN
	SO+w==
X-Gm-Message-State: AOAM532uvWTAcoG3nDRQIzMUN+/Rm8SvMkXZa/Fa265rAiB1ox0TDXZ3
	BaPvdU04M6xpw1AN3OQPPoJx7dPfvq0LZNyGBgSqpHeM/jUNxswTa6XNfkpR7lBPweqUwLhCTga
	qXsc18xm/NDEJX0ZeciOmFVqsA40bclGNZfVaOg==
X-Received: by 2002:a1c:2d84:: with SMTP id t126mr4967872wmt.132.1606325669898;
	Wed, 25 Nov 2020 09:34:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJLWF/0ZKLW0VKkzOGBGvVhR7SU2BcAbaYKGX3BAFtZCuKmthF3o5G7J6Q8TsPKRr7fk7H3qy3rWp9IhIOBc4=
X-Received: by 2002:a1c:2d84:: with SMTP id t126mr4967855wmt.132.1606325669674;
	Wed, 25 Nov 2020 09:34:29 -0800 (PST)
MIME-Version: 1.0
References: <133471958.29450607.1606249651903.JavaMail.zimbra@redhat.com>
	<1899966741.29450616.1606249680993.JavaMail.zimbra@redhat.com>
In-Reply-To: <1899966741.29450616.1606249680993.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 25 Nov 2020 18:34:18 +0100
Message-ID: <CAHc6FU5dG2baYvgE_rpAPv+L9snNhy0yUvSBd2hyxv=gHPJTKA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Don't freeze the file system
 during unmount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, Nov 24, 2020 at 9:28 PM Bob Peterson <rpeterso@redhat.com> wrote:
> GFS2's freeze/thaw mechanism uses a special freeze glock to control its
> operation. It does this with a sync glock operation (glops.c) called
> freeze_go_sync. When the freeze glock is demoted (glock's do_xmote) the
> glops function causes the file system to be frozen. This is intended. However,
> GFS2's mount and unmount processes also hold the freeze glock to prevent other
> processes, perhaps on different cluster nodes, from mounting the frozen file
> system in read-write mode.
>
> Before this patch, there was no check in freeze_go_sync for whether a freeze
> in intended or whether the glock demote was caused by a normal unmount.
> So it was trying to freeze the file system it's trying to unmount, which
> ends up in a deadlock.
>
> This patch adds an additional check to freeze_go_sync so that demotes of the
> freeze glock are ignored if they come from the unmount process.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glops.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index e2cfc00ab936..3faa421568b0 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -582,7 +582,8 @@ static int freeze_go_sync(struct gfs2_glock *gl)
>          * Once thawed, the work func acquires the freeze glock in
>          * SH and everybody goes back to thawed.
>          */
> -       if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp)) {
> +       if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp) &&
> +           !test_bit(SDF_NORECOVERY, &sdp->sd_flags)) {
>                 atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
>                 error = freeze_super(sdp->sd_vfs);
>                 if (error) {

I'll send this to Linus in the next batch of 5.10 fixes.

Thanks,
Andreas

