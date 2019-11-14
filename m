Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8072FCFD2
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 21:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573764311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Za8GC45dZ1QkZ4nvEaCS8hmtvUB33BtrLuapjxdjpf8=;
	b=SifOnADcHdx6bivBfMhfPhF3ovx+lachPnNMXDLSkSobSbOOLarHuo8dj6x8VFjqQm/LTV
	HaH3cLTCSV8MRn0VB2jsdNT4diQRgZthb4KhxCkPW+rW+w5qMoMc21aFtWIAknj2SxbWLZ
	uGqyFXruHJPKtT5ht4ic709+XYlk5hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-nMFGxiU4Owu_cuUliUc-8Q-1; Thu, 14 Nov 2019 15:45:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCE01005510;
	Thu, 14 Nov 2019 20:45:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 271021001902;
	Thu, 14 Nov 2019 20:45:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 331AA4BB5B;
	Thu, 14 Nov 2019 20:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEKj16i012389 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 15:45:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB3896F9FD; Thu, 14 Nov 2019 20:45:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5A12728E7
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:44:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E201035E05
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:44:59 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-37-Op3JH2QMPZqvqQ-u5z5bZQ-1; Thu, 14 Nov 2019 15:44:58 -0500
Received: by mail-oi1-f197.google.com with SMTP id d204so3771048oia.20
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 12:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=09rPc++JrVYo8Dwq6OrnCLP+DaWnnLZYmp/u/d9YtEY=;
	b=G3p9MklSACnYdGugnJMcQ1NU4Lr4YOxzIBYfNDoWwx6OlF2+qNx6H7OtCJkIpHgVXQ
	Rd5171VhARbU4GTt+sk0hUaFXLP5qkhtjD8ltjCSgLZRYbbZ/Bb98FaM1KcXjGwOSMKE
	KZbEMF1iPjvrNDnIMEKbdVrJzy9KBCDJVlFIRRnpPsyWp9xhTkT11BH7N0KHF31i1pgq
	K9ZqxtwoPytoGaWxn+rEKGg/8lgLgi6pkicboIQJ/2rerOGkJyM28o+e6UV2+41biWpt
	eVH1bCjMSYWEOICSKlis5iseOtiPcpH8GJXr/0HsqULnRnfTnUnuRQtqTFRkGI6t34Vy
	wcTg==
X-Gm-Message-State: APjAAAUQnlCke9MDygk68iZpr3Nzksd53tncXcP60m6Y+8Hdf3NqvuI7
	9V0C4W5E2ynsjPU9/mLrbmdD/Tr9kIcwKu4ZutIFs9gFk0iD0pSsT3ohLPz6as48XF0bWPBmOOH
	SubGLoFAtGYj8T9INxW3sPjOlLUXBDHtz1NeWrg==
X-Received: by 2002:a9d:7cd8:: with SMTP id r24mr7969169otn.95.1573764297445; 
	Thu, 14 Nov 2019 12:44:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyui8enr2uFhlqrf26PEF0htcShkpAlKrywg+jIHAVg8MaeDAmb3tKtathPBm4Lt7MmCncsdtBkDPPxiZCUmnA=
X-Received: by 2002:a9d:7cd8:: with SMTP id r24mr7969154otn.95.1573764297106; 
	Thu, 14 Nov 2019 12:44:57 -0800 (PST)
MIME-Version: 1.0
References: <2080848299.29962639.1573751528070.JavaMail.zimbra@redhat.com>
	<1332745873.29963225.1573751537840.JavaMail.zimbra@redhat.com>
In-Reply-To: <1332745873.29963225.1573751537840.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 14 Nov 2019 21:44:45 +0100
Message-ID: <CAHc6FU5tPnpXqmxHfNF1aTMzF89LHECzej=RRnJVPFHRGDKRaQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: Op3JH2QMPZqvqQ-u5z5bZQ-1
X-MC-Unique: nMFGxiU4Owu_cuUliUc-8Q-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAEKj16i012389
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Abort gfs2_freeze if io
 error is seen
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 6:13 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, an io error, such as -EIO writing to the journal
> would cause function gfs2_freeze to go into an infinite loop,
> continuously retrying the freeze operation. But nothing ever clears
> the -EIO except unmount after withdraw, which is impossible if the
> freeze operation never ends (fails). Instead you get:
>
> [ 6499.767994] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
> [ 6499.773058] gfs2: fsid=3Ddm-32.0: retrying...
> [ 6500.791957] gfs2: fsid=3Ddm-32.0: error freezing FS: -5
> [ 6500.797015] gfs2: fsid=3Ddm-32.0: retrying...
>
> This patch adds a check for -EIO in gfs2_freeze, and if seen, it
> dequeues the freeze glock, aborts the loop and returns the error.
> Also, there's no need to pass the freeze holder to function
> gfs2_lock_fs_check_clean since it's only called in one place and
> it's a well-known superblock pointer, so this simplifies that.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/super.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 8154c38e488b..eb1fbd533e6d 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -399,8 +399,7 @@ struct lfcc {
>   * Returns: errno
>   */
>
> -static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp,
> -                                   struct gfs2_holder *freeze_gh)
> +static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
>  {
>         struct gfs2_inode *ip;
>         struct gfs2_jdesc *jd;
> @@ -425,7 +424,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *=
sdp,
>         }
>
>         error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_EXCLUSIVE,
> -                                  GL_NOCACHE, freeze_gh);
> +                                  GL_NOCACHE, &sdp->sd_freeze_gh);

Missing here:

        if (error)
              goto out;

>         list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
>                 error =3D gfs2_jdesc_check(jd);
> @@ -441,7 +440,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *=
sdp,
>         }
>
>         if (error)
> -               gfs2_glock_dq_uninit(freeze_gh);
> +               gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
>
>  out:
>         while (!list_empty(&list)) {
> @@ -767,15 +766,20 @@ static int gfs2_freeze(struct super_block *sb)
>                         goto out;
>                 }
>
> -               error =3D gfs2_lock_fs_check_clean(sdp, &sdp->sd_freeze_g=
h);
> +               error =3D gfs2_lock_fs_check_clean(sdp);
>                 if (!error)
>                         break;
>
>                 if (error =3D=3D -EBUSY)
>                         fs_err(sdp, "waiting for recovery before freeze\n=
");
> -               else
> +               else if (error =3D=3D -EIO) {
> +                       fs_err(sdp, "Fatal IO error: cannot freeze gfs2 d=
ue "
> +                              "to recovery error.\n");
> +                       gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);

Instead of this, gfs2_lock_fs_check_clean should make sure it doesn't
keep sd_freeze_ghl held when it fails.

> +                       goto out;
> +               } else {
>                         fs_err(sdp, "error freezing FS: %d\n", error);
> -
> +               }
>                 fs_err(sdp, "retrying...\n");
>                 msleep(1000);
>         }
>

Thanks,
Andreas


