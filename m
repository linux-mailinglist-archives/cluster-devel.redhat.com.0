Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0607D1473BB
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 23:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579818192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S1AmPT6pZpX0Vn1uV1Q7/Ag3zo9q7XjwxH/HejLRlSA=;
	b=P+B3K+l8o1NXyfJ2YRwDS+/LlYFJ399lQ/oS0esAD/4JNIvL7f3sQhnSM6S8n5SOPsm8Ht
	9HsRdJuXbIFPV31vplTRsOmuTHUixZCJYbavf1hxdzYFk6IuJFOyRaM7IrvBeIGzUQebSR
	dtReMfCTpDoPJSMXxaV/uqtLCFh//tQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-OI3BmdWYPI69IwSt87bYlQ-1; Thu, 23 Jan 2020 17:23:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C87E801F80;
	Thu, 23 Jan 2020 22:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CA8B5E26C;
	Thu, 23 Jan 2020 22:23:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3663618089C8;
	Thu, 23 Jan 2020 22:23:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NMN11V006579 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 17:23:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E79742166B28; Thu, 23 Jan 2020 22:23:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A232166B2F
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 22:22:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2373D8E3862
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 22:22:59 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-lTtFKgQyOWW8Uy9jr7t9Cg-1; Thu, 23 Jan 2020 17:22:57 -0500
Received: by mail-oi1-f198.google.com with SMTP id c73so1812604oig.21
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 14:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fqbw96j3FWF37yd3PdSdFkVpbuLcJZ1O5OfHXphrK+Y=;
	b=Xzz4degVbWxAaUex8xGRVIsMRZum2Qdsy3K9uGDIyqVDEzHq2TqYvlfO/LyZZiDF+1
	ZRV8HuRsGFPEedEVV2cUywXE2kp4crBJUtCuu/TpjGnRbeFryVgBG/88JtMvPUx818h0
	N3Jj1t554pGGFfyZIXOdjcCZEu0MH8CQr5EQ078jnwwT49bA46+ghd4YCAhX2SJbhdBw
	XnIlcDWRao0BfbU0/0tgQQ1CStcJ7C7UL6M7n3ztKF93A0iw7LLZLoMMVyV8A7mWLuQd
	ru52cdcs9k5yuFHctB2qfkAWkNppvdOA4krt65TDKF4mswWYKoBtCY+KNa3fTaHw0qHx
	s7pg==
X-Gm-Message-State: APjAAAVrzHwG4d1FLOV+rSAer5Zw6JVdVVLKNa86nBZ2QXhYOnmF8l7e
	MjPdgyQRFZtdDtsQH4RsE8mUJChj+OeEpD1C7WVAOJV1okyQO6l915r91Kwh+ckqeljvFV6AjSz
	lD1FcJ8lgt6yQMsJH01ehd92hzRE/SlXw9aU9JA==
X-Received: by 2002:a05:6830:231d:: with SMTP id
	u29mr471390ote.185.1579818176134; 
	Thu, 23 Jan 2020 14:22:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHCEzZEim2w6qutIOQ2ZRqKmZNBcwdInkDJvdPC7q3LZVvPMObA1mebBR3v/Z166gVZsoZQI3L9F/xImQJvDY=
X-Received: by 2002:a05:6830:231d:: with SMTP id
	u29mr471351ote.185.1579818175266; 
	Thu, 23 Jan 2020 14:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20191209153700.700208-1-rpeterso@redhat.com>
	<20191209153700.700208-17-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-17-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 23 Jan 2020 23:22:44 +0100
Message-ID: <CAHc6FU6vgpMs1pO1t4odWNq_J+Cxdck+E+S=zRhFGwYL=Qu6aQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: lTtFKgQyOWW8Uy9jr7t9Cg-1
X-MC-Unique: OI3BmdWYPI69IwSt87bYlQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NMN11V006579
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 v8 PATCH 16/22] gfs2: new slab for
	transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 4:38 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch adds a new slab for gfs2 transactions. That allows us to
> have an initialization function and protect against some errors.

The added checks in gfs2_trans_free actually have nothing to do with

>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glops.c |  1 +
>  fs/gfs2/log.c   | 14 +++++++++++---
>  fs/gfs2/lops.c  |  4 ++++
>  fs/gfs2/main.c  | 23 +++++++++++++++++++++++
>  fs/gfs2/trans.c | 28 ++++++++++++++++++++++------
>  fs/gfs2/trans.h |  1 +
>  fs/gfs2/util.c  |  1 +
>  fs/gfs2/util.h  |  1 +
>  8 files changed, 64 insertions(+), 9 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index d8f9ee756c0e..e0219b0e2229 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -89,6 +89,7 @@ static void gfs2_ail_empty_gl(struct gfs2_glock *gl)
>         memset(&tr, 0, sizeof(tr));
>         INIT_LIST_HEAD(&tr.tr_buf);
>         INIT_LIST_HEAD(&tr.tr_databuf);
> +       set_bit(TR_ATTACHED, &tr.tr_flags); /* prevent gfs2_trans_end fre=
e */
>         tr.tr_revokes =3D atomic_read(&gl->gl_ail_count);
>
>         if (!tr.tr_revokes)
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index f543899c4d70..2b4217883b72 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -30,6 +30,7 @@
>  #include "util.h"
>  #include "dir.h"
>  #include "trace_gfs2.h"
> +#include "trans.h"
>
>  static void gfs2_log_shutdown(struct gfs2_sbd *sdp);
>
> @@ -331,7 +332,7 @@ static void ail2_empty(struct gfs2_sbd *sdp, unsigned=
 int new_tail)
>                 list_del(&tr->tr_list);
>                 gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
>                 gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
> -               kfree(tr);
> +               gfs2_trans_free(sdp, tr);
>         }
>
>         spin_unlock(&sdp->sd_ail_lock);
> @@ -876,7 +877,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2=
_glock *gl, u32 flags)
>         trace_gfs2_log_flush(sdp, 0, flags);
>         up_write(&sdp->sd_log_flush_lock);
>
> -       kfree(tr);
> +       gfs2_trans_free(sdp, tr);
>  }
>
>  /**
> @@ -895,6 +896,12 @@ static void gfs2_merge_trans(struct gfs2_trans *old,=
 struct gfs2_trans *new)
>         old->tr_num_databuf_rm  +=3D new->tr_num_databuf_rm;
>         old->tr_num_revoke      +=3D new->tr_num_revoke;
>
> +       new->tr_num_buf_new     =3D 0;
> +       new->tr_num_buf_rm      =3D 0;
> +       new->tr_num_databuf_new =3D 0;
> +       new->tr_num_databuf_rm  =3D 0;
> +       new->tr_num_revoke      =3D 0;
> +
>         list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
>         list_splice_tail_init(&new->tr_buf, &old->tr_buf);
>  }
> @@ -904,6 +911,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct g=
fs2_trans *tr)
>         unsigned int reserved;
>         unsigned int unused;
>         unsigned int maxres;
> +       unsigned int new_revokes =3D tr->tr_num_revoke;
>
>         gfs2_log_lock(sdp);
>
> @@ -915,7 +923,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct g=
fs2_trans *tr)
>                 set_bit(TR_ATTACHED, &tr->tr_flags);
>         }
>
> -       sdp->sd_log_commited_revoke +=3D tr->tr_num_revoke;
> +       sdp->sd_log_commited_revoke +=3D new_revokes;
>         reserved =3D calc_reserved(sdp);
>         maxres =3D sdp->sd_log_blks_reserved + tr->tr_reserved;
>         gfs2_assert_withdraw(sdp, maxres >=3D reserved);
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 2f4c478e7bb7..99b366a6e4e6 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -730,6 +730,8 @@ static void buf_lo_after_commit(struct gfs2_sbd *sdp,=
 struct gfs2_trans *tr)
>                 list_del_init(&bd->bd_list);
>                 gfs2_unpin(sdp, bd->bd_bh, tr);
>         }
> +       tr->tr_num_buf_new =3D 0;
> +       tr->tr_num_buf_rm =3D 0;
>  }
>
>  static void buf_lo_before_scan(struct gfs2_jdesc *jd,
> @@ -1079,6 +1081,8 @@ static void databuf_lo_after_commit(struct gfs2_sbd=
 *sdp, struct gfs2_trans *tr)
>                 list_del_init(&bd->bd_list);
>                 gfs2_unpin(sdp, bd->bd_bh, tr);
>         }
> +       tr->tr_num_databuf_new =3D 0;
> +       tr->tr_num_databuf_rm =3D 0;
>  }
>
>
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index a1a295b739fb..5ff114bbcede 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -68,6 +68,19 @@ static void gfs2_init_gl_aspace_once(void *foo)
>         address_space_init_once(mapping);
>  }
>
> +static void gfs2_init_tr_once(void *foo)
> +{
> +       struct gfs2_trans *tr =3D foo;
> +
> +       memset(tr, 0, sizeof(struct gfs2_trans));
> +       INIT_LIST_HEAD(&tr->tr_databuf);
> +       INIT_LIST_HEAD(&tr->tr_buf);
> +       INIT_LIST_HEAD(&tr->tr_ail1_list);
> +       INIT_LIST_HEAD(&tr->tr_ail2_list);
> +       INIT_LIST_HEAD(&tr->tr_list);
> +       tr->tr_ip =3D 0;
> +}
> +
>  /**
>   * init_gfs2_fs - Register GFS2 as a filesystem
>   *
> @@ -143,6 +156,13 @@ static int __init init_gfs2_fs(void)
>         if (!gfs2_qadata_cachep)
>                 goto fail_cachep7;
>
> +       gfs2_trans_cachep =3D kmem_cache_create("gfs2_trans",
> +                                              sizeof(struct gfs2_trans),
> +                                              0, SLAB_CONSISTENCY_CHECKS=
|
> +                                              SLAB_POISON, gfs2_init_tr_=
once);

I don't think SLAB_CONSISTENCY_CHECKS should be enabled permanently.
It can always be enabled at boot time via the slub_debug kernel
command line parameter, though.

> +       if (!gfs2_trans_cachep)
> +               goto fail_cachep8;
> +
>         error =3D register_shrinker(&gfs2_qd_shrinker);
>         if (error)
>                 goto fail_shrinker;
> @@ -194,6 +214,8 @@ static int __init init_gfs2_fs(void)
>  fail_fs1:
>         unregister_shrinker(&gfs2_qd_shrinker);
>  fail_shrinker:
> +       kmem_cache_destroy(gfs2_trans_cachep);
> +fail_cachep8:
>         kmem_cache_destroy(gfs2_qadata_cachep);
>  fail_cachep7:
>         kmem_cache_destroy(gfs2_quotad_cachep);
> @@ -236,6 +258,7 @@ static void __exit exit_gfs2_fs(void)
>         rcu_barrier();
>
>         mempool_destroy(gfs2_page_pool);
> +       kmem_cache_destroy(gfs2_trans_cachep);
>         kmem_cache_destroy(gfs2_qadata_cachep);
>         kmem_cache_destroy(gfs2_quotad_cachep);
>         kmem_cache_destroy(gfs2_rgrpd_cachep);
> diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
> index 9d4227330de4..50f902a23c4d 100644
> --- a/fs/gfs2/trans.c
> +++ b/fs/gfs2/trans.c
> @@ -37,7 +37,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int=
 blocks,
>         if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
>                 return -EROFS;
>
> -       tr =3D kzalloc(sizeof(struct gfs2_trans), GFP_NOFS);
> +       tr =3D kmem_cache_alloc(gfs2_trans_cachep, GFP_NOFS);
>         if (!tr)
>                 return -ENOMEM;
>
> @@ -45,14 +45,19 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned i=
nt blocks,
>         tr->tr_blocks =3D blocks;
>         tr->tr_revokes =3D revokes;
>         tr->tr_reserved =3D 1;
> +       tr->tr_num_revoke =3D 0;
> +
> +       clear_bit(TR_TOUCHED, &tr->tr_flags);
> +       clear_bit(TR_ATTACHED, &tr->tr_flags);
> +
>         set_bit(TR_ALLOCED, &tr->tr_flags);
>         if (blocks)
>                 tr->tr_reserved +=3D 6 + blocks;
>         if (revokes)
>                 tr->tr_reserved +=3D gfs2_struct2blk(sdp, revokes,
>                                                    sizeof(u64));
> -       INIT_LIST_HEAD(&tr->tr_databuf);
> -       INIT_LIST_HEAD(&tr->tr_buf);
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));

These asserts don't seem to make sense; this must have been checked in
gfs2_trans_free already.

>
>         sb_start_intwrite(sdp->sd_vfs);
>
> @@ -66,7 +71,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int=
 blocks,
>
>  fail:
>         sb_end_intwrite(sdp->sd_vfs);
> -       kfree(tr);
> +       kmem_cache_free(gfs2_trans_cachep, tr);
>
>         return error;
>  }
> @@ -94,7 +99,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
>         if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
>                 gfs2_log_release(sdp, tr->tr_reserved);
>                 if (alloced) {
> -                       kfree(tr);
> +                       gfs2_trans_free(sdp, tr);
>                         sb_end_intwrite(sdp->sd_vfs);
>                 }
>                 return;
> @@ -110,7 +115,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
>
>         gfs2_log_commit(sdp, tr);
>         if (alloced && !test_bit(TR_ATTACHED, &tr->tr_flags))
> -               kfree(tr);
> +               gfs2_trans_free(sdp, tr);
>         up_read(&sdp->sd_log_flush_lock);
>
>         if (sdp->sd_vfs->s_flags & SB_SYNCHRONOUS)
> @@ -273,3 +278,14 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, =
u64 blkno, unsigned int len)
>         gfs2_log_unlock(sdp);
>  }
>
> +void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
> +{
> +       if (tr =3D=3D NULL)
> +               return;
> +
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_ail2_list));
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
> +       gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
> +       kmem_cache_free(gfs2_trans_cachep, tr);
> +}
> diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
> index 6071334de035..83199ce5a5c5 100644
> --- a/fs/gfs2/trans.h
> +++ b/fs/gfs2/trans.h
> @@ -42,5 +42,6 @@ extern void gfs2_trans_add_data(struct gfs2_glock *gl, =
struct buffer_head *bh);
>  extern void gfs2_trans_add_meta(struct gfs2_glock *gl, struct buffer_hea=
d *bh);
>  extern void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufd=
ata *bd);
>  extern void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, un=
signed int len);
> +extern void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)=
;
>
>  #endif /* __TRANS_DOT_H__ */
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index 690a2f575709..04141d0d8e17 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -32,6 +32,7 @@ struct kmem_cache *gfs2_bufdata_cachep __read_mostly;
>  struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
>  struct kmem_cache *gfs2_quotad_cachep __read_mostly;
>  struct kmem_cache *gfs2_qadata_cachep __read_mostly;
> +struct kmem_cache *gfs2_trans_cachep __read_mostly;
>  mempool_t *gfs2_page_pool __read_mostly;
>
>  void gfs2_assert_i(struct gfs2_sbd *sdp)
> diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
> index f23cced3809e..479d351c24a7 100644
> --- a/fs/gfs2/util.h
> +++ b/fs/gfs2/util.h
> @@ -154,6 +154,7 @@ extern struct kmem_cache *gfs2_bufdata_cachep;
>  extern struct kmem_cache *gfs2_rgrpd_cachep;
>  extern struct kmem_cache *gfs2_quotad_cachep;
>  extern struct kmem_cache *gfs2_qadata_cachep;
> +extern struct kmem_cache *gfs2_trans_cachep;
>  extern mempool_t *gfs2_page_pool;
>  extern struct workqueue_struct *gfs2_control_wq;
>
> --
> 2.23.0
>


