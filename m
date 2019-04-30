Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17A101C9
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 23:25:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B60BD59463;
	Tue, 30 Apr 2019 21:25:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A15C57191A;
	Tue, 30 Apr 2019 21:25:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFE0718089CB;
	Tue, 30 Apr 2019 21:25:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3ULNRFZ005250 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 17:23:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC39D6D7EE; Tue, 30 Apr 2019 21:23:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A61526D0AD
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 21:23:25 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 418AAC058CB4
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 21:23:25 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id o34so14929435qte.5
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 14:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=tX66GjNkVrB1BmGNDzEbrXzhKR/W2hruti1ApYqoGFs=;
	b=g3P7coKAos4SEhg0ay0PoaZCVAav+8DjREiq31O7whzcRnl8Qy9COm25nnIlHod51T
	5stlsJYNXGxrXADvzCxMsovyUDFYtXoFb4xDBkZ1fwj0CBSFJeTdfLGSj49qKRB3aj4n
	bGJAhIkk3hVN5U+Xfu4BsDZySHyIeJaVKFaHnuDJyziYA3N4Ru5MozihTmsCxHhbn3ef
	fyRyiehsTlcXzQ/vFTykzgWoOuQtrkdnQRWyCHEPfSEH5JzPX8zKVZfBCeArXOS/5kbN
	injHE3xdgxhnl1SyZ1FMecmYDDxlLNuhjQyduFJRvWQtw7/sgq5ULV4JtPkBumhXS/kL
	f7Gw==
X-Gm-Message-State: APjAAAWfPt4qJc4nteX7AUCQJes9aYHqQsBWYMRRvYhp5yoqxwBM6aUo
	IVUhMDRYDBKaBn2Dt8bIVqYQc6G/0OXvkP4vCU0nv5Z/n6UAmu6MaGFkrsggwViRMQIVlZzfcpO
	tJ8yAEzS1NgIEI3cf0MDaHUSxf3PdIZhWBQnwrQ==
X-Received: by 2002:ac8:93b:: with SMTP id t56mr20912585qth.390.1556659404272; 
	Tue, 30 Apr 2019 14:23:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXg6UNIuCMF2Jea2LNDKbOyOCMB/aFkqIWrRm6q3twzw2UPrWPSNIzEuVGnd+b/0mFRrAw3irv7jDH2a4KYHI=
X-Received: by 2002:ac8:93b:: with SMTP id t56mr20912576qth.390.1556659404131; 
	Tue, 30 Apr 2019 14:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190430174830.18057-1-adas@redhat.com>
In-Reply-To: <20190430174830.18057-1-adas@redhat.com>
From: Abhijith Das <adas@redhat.com>
Date: Tue, 30 Apr 2019 16:23:13 -0500
Message-ID: <CACrDRjg06y3Cu4PM78SiNO_EwPNO_m=hju4Vd4O6MLVoqSrsaA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d1e7090587c602d3"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix race between gfs2_freeze_func
 and unmount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 30 Apr 2019 21:25:43 +0000 (UTC)

--000000000000d1e7090587c602d3
Content-Type: text/plain; charset="UTF-8"

NACK. Andreas mentioned that the description could be more descriptive and
that we should be using clear_bit_unlock() instead of clear_bit(). I'll
post a v2 shortly with these changes.

Cheers!
--Abhi

On Tue, Apr 30, 2019 at 12:48 PM Abhi Das <adas@redhat.com> wrote:

> gfs2_unfreee() doesn't wait for gfs2_freeze_func() to complete. If a
> umount is issued right after unfreeze, it could result in an
> inconsistent filesystem because some journal data (statfs update)
> wasn't written out.
>
> This patch causes gfs2_unfreeze() to wait for gfs2_freeze_func() to
> complete before returning to the user.
>
> Signed-off-by: Abhi Das <adas@redhat.com>
> ---
>  fs/gfs2/incore.h | 1 +
>  fs/gfs2/super.c  | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
> index 78c8e761b321..b15755068593 100644
> --- a/fs/gfs2/incore.h
> +++ b/fs/gfs2/incore.h
> @@ -621,6 +621,7 @@ enum {
>         SDF_SKIP_DLM_UNLOCK     = 8,
>         SDF_FORCE_AIL_FLUSH     = 9,
>         SDF_AIL1_IO_ERROR       = 10,
> +       SDF_FS_FROZEN           = 11,
>  };
>
>  enum gfs2_freeze_state {
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index a6a325b2a78b..a81d7a5afe39 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -973,8 +973,7 @@ void gfs2_freeze_func(struct work_struct *work)
>         if (error) {
>                 printk(KERN_INFO "GFS2: couldn't get freeze lock : %d\n",
> error);
>                 gfs2_assert_withdraw(sdp, 0);
> -       }
> -       else {
> +       } else {
>                 atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
>                 error = thaw_super(sb);
>                 if (error) {
> @@ -987,6 +986,8 @@ void gfs2_freeze_func(struct work_struct *work)
>                 gfs2_glock_dq_uninit(&freeze_gh);
>         }
>         deactivate_super(sb);
> +       clear_bit(SDF_FS_FROZEN, &sdp->sd_flags);
> +       wake_up_bit(&sdp->sd_flags, SDF_FS_FROZEN);
>         return;
>  }
>
> @@ -1029,6 +1030,7 @@ static int gfs2_freeze(struct super_block *sb)
>                 msleep(1000);
>         }
>         error = 0;
> +       set_bit(SDF_FS_FROZEN, &sdp->sd_flags);
>  out:
>         mutex_unlock(&sdp->sd_freeze_mutex);
>         return error;
> @@ -1053,7 +1055,7 @@ static int gfs2_unfreeze(struct super_block *sb)
>
>         gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
>         mutex_unlock(&sdp->sd_freeze_mutex);
> -       return 0;
> +       return wait_on_bit(&sdp->sd_flags, SDF_FS_FROZEN,
> TASK_INTERRUPTIBLE);
>  }
>
>  /**
> --
> 2.20.1
>
>

--000000000000d1e7090587c602d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">NACK. Andreas mentioned that the description could be more des=
criptive and that we should be using clear_bit_unlock() instead of clear_bi=
t(). I&#39;ll post a v2 shortly with these changes.</div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">Cheers!</div><=
div class=3D"gmail_default" style=3D"font-family:monospace,monospace">--Abh=
i</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Apr 30, 2019 at 12:48 PM Abhi Das &lt;<a href=3D"mailto:adas=
@redhat.com">adas@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">gfs2_unfreee() doesn&#39;t wait for gfs2_freeze=
_func() to complete. If a<br>
umount is issued right after unfreeze, it could result in an<br>
inconsistent filesystem because some journal data (statfs update)<br>
wasn&#39;t written out.<br>
<br>
This patch causes gfs2_unfreeze() to wait for gfs2_freeze_func() to<br>
complete before returning to the user.<br>
<br>
Signed-off-by: Abhi Das &lt;<a href=3D"mailto:adas@redhat.com" target=3D"_b=
lank">adas@redhat.com</a>&gt;<br>
---<br>
=C2=A0fs/gfs2/incore.h | 1 +<br>
=C2=A0fs/gfs2/super.c=C2=A0 | 8 +++++---<br>
=C2=A02 files changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h<br>
index 78c8e761b321..b15755068593 100644<br>
--- a/fs/gfs2/incore.h<br>
+++ b/fs/gfs2/incore.h<br>
@@ -621,6 +621,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDF_SKIP_DLM_UNLOCK=C2=A0 =C2=A0 =C2=A0=3D 8,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDF_FORCE_AIL_FLUSH=C2=A0 =C2=A0 =C2=A0=3D 9,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDF_AIL1_IO_ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SDF_FS_FROZEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 11,<br>
=C2=A0};<br>
<br>
=C2=A0enum gfs2_freeze_state {<br>
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c<br>
index a6a325b2a78b..a81d7a5afe39 100644<br>
--- a/fs/gfs2/super.c<br>
+++ b/fs/gfs2/super.c<br>
@@ -973,8 +973,7 @@ void gfs2_freeze_func(struct work_struct *work)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO &q=
uot;GFS2: couldn&#39;t get freeze lock : %d\n&quot;, error);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_assert_withdra=
w(sdp, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_set(&amp;sdp=
-&gt;sd_freeze_state, SFS_UNFROZEN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D thaw_supe=
r(sb);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error) {<br>
@@ -987,6 +986,8 @@ void gfs2_freeze_func(struct work_struct *work)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_glock_dq_unini=
t(&amp;freeze_gh);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 deactivate_super(sb);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_bit(SDF_FS_FROZEN, &amp;sdp-&gt;sd_flags)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_bit(&amp;sdp-&gt;sd_flags, SDF_FS_FROZE=
N);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0}<br>
<br>
@@ -1029,6 +1030,7 @@ static int gfs2_freeze(struct super_block *sb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msleep(1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(SDF_FS_FROZEN, &amp;sdp-&gt;sd_flags);<=
br>
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;sdp-&gt;sd_freeze_mutex);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return error;<br>
@@ -1053,7 +1055,7 @@ static int gfs2_unfreeze(struct super_block *sb)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfs2_glock_dq_uninit(&amp;sdp-&gt;sd_freeze_gh)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;sdp-&gt;sd_freeze_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return wait_on_bit(&amp;sdp-&gt;sd_flags, SDF_F=
S_FROZEN, TASK_INTERRUPTIBLE);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--000000000000d1e7090587c602d3--

