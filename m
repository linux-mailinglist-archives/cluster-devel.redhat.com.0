Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B6D6FEE01
	for <lists+cluster-devel@lfdr.de>; Thu, 11 May 2023 10:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683794874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BUvRcMCkZuFJum/QRY3Mgmo6T1bsgjROFmZyPuVnMKo=;
	b=F5h6DfUoVkyh5SUJOQDBn+bPTtDUPaTWKC9PUn0GXrsecSyEyWXMYdrLGauKu9L5JFQeuE
	Eyt6sXQ2MPqMJXkEedP1cndPz0e65vl49CwxCcCiS0PW7duQNH4m9rXCHJxS/VVpU9+TZ6
	m3oH/SaKyrEuQyKLrHsI9WVL7TdgcbM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-HAhVlsjKOrStaKNj0v3cVA-1; Thu, 11 May 2023 04:47:51 -0400
X-MC-Unique: HAhVlsjKOrStaKNj0v3cVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CF8528043E1;
	Thu, 11 May 2023 08:47:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B6414078906;
	Thu, 11 May 2023 08:47:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7CA819451CB;
	Thu, 11 May 2023 08:47:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58C1A19451C5 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 11 May 2023 08:47:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3974F2026D25; Thu, 11 May 2023 08:47:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CC12026D16
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 08:47:48 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1534A87083C
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 08:47:48 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-G4NbTMWOO-61NXlm_aBmtQ-1; Thu, 11 May 2023 04:47:39 -0400
X-MC-Unique: G4NbTMWOO-61NXlm_aBmtQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3f38c97c8acso31286391cf.2
 for <cluster-devel@redhat.com>; Thu, 11 May 2023 01:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683794858; x=1686386858;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUvRcMCkZuFJum/QRY3Mgmo6T1bsgjROFmZyPuVnMKo=;
 b=TbZ9UTW/pYixMaeeVgkHiJ8Pf98jMNkaJqrLH/YpCEImbgDPURu6BQKnFq5+xb480G
 /aI0ybZYNxhe2YhLEwLT0vu/YG9fY5dd4gM/NNip8dxeUU3iu7o9q63BTvAPpkyvdJ2s
 Yz9X2rk2sRtAc4+wtaijYdVmNm0dCKGxJvss1tcVmgRUZHaccyMHv1N/0iWUJ4P1/pxB
 ob2ZEVsB4txbhEtJ6oFcI2b8cOYlRS0XqpeOMfPQY2dkhm0UiR3PRvKRwgL3G2f2QU6V
 7BuVkspJL+LWvEqT/8+BjbgUwXM5y764VIrIVgMDjvjJTn8KvBmZiJ416Lg+w84AYVkL
 M7jA==
X-Gm-Message-State: AC+VfDw7es0mu3bTOKP1KoqYMLhUAObo4B57kc0tC9fbiTxydsqbqhQN
 UpEgOuSnBF2NJ8Krdskh7ix8dHiN+61FVrgp3+rY5EX/RuX2qFoFiJQZTu1wcxjlNkKuVTVes0a
 y0xbShv3gJoTGU1N8r1vPLUOoc7jz3g==
X-Received: by 2002:a05:622a:105:b0:3ef:2f92:464d with SMTP id
 u5-20020a05622a010500b003ef2f92464dmr28099663qtw.28.1683794858262; 
 Thu, 11 May 2023 01:47:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4B1KL0O7oYOV5m/jEWyn8nrY4TqWkYnXJVNuciVtAz5aUZGwJp7i/BcgoOp7Y5nEk/ynHLow==
X-Received: by 2002:a05:622a:105:b0:3ef:2f92:464d with SMTP id
 u5-20020a05622a010500b003ef2f92464dmr28099653qtw.28.1683794857977; 
 Thu, 11 May 2023 01:47:37 -0700 (PDT)
Received: from
 0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
 (0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:ffda:0:2059:8730:b2:c370])
 by smtp.gmail.com with ESMTPSA id
 r23-20020ac87ef7000000b003b63b8df24asm2071010qtc.36.2023.05.11.01.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:47:37 -0700 (PDT)
Message-ID: <d718cce68afe7db827103dbc4886f4982b1ad83a.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>, cluster-devel
 <cluster-devel@redhat.com>
Date: Thu, 11 May 2023 09:47:35 +0100
In-Reply-To: <20230510190818.125286-1-rpeterso@redhat.com>
References: <20230510190818.125286-1-rpeterso@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] gfs2: Don't free rgrp clone bitmaps
 until go_inval
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


On Wed, 2023-05-10 at 15:08 -0400, Bob Peterson wrote:
> Before this patch, every time an rgrp was synced (go_sync) the
> clone bitmaps were freed. We do not need to free the bitmaps in many
> common cases. For example when demoting the glock from EXCLUSIVE to
> SHARED. This is especially wasteful in cases where we unlink lots of
> files: the rgrps are transitioned to EX, then back to SH multiple
> times as it looks at the dinode allocation states, then frees them,
> but the clones prevent allocations until the files are evicted.
> Subsequent uses often cause the rgrp glock to be transitioned from
> SH to EX and back again in rapid succession.
>=20
> In these cases it's proper to sync the rgrp bitmaps to the storage
> media
> but wasteful to free the clones, because the very next unlink needs
> to
> reallocate the clone bitmaps again. So in short, today we have:
>=20
> 1. SH->EX (for unlink or other)
> 2. Allocate (kmalloc) a clone bitmap.
> 3. Clear the bits in original bitmap.
> 4. Keep original state in the clone bitmap to prevent re-allocation
> =C2=A0=C2=A0 until the last user closes the file.
> 5. EX->SH
> 6. Sync bitmap to storage media.
> 7. Free the clone bitmaps.
> 8. Go to 1.
>=20
> This repeated kmalloc -> kfree -> kmalloc -> kfree is a waste of
> time:

It is a waste of time. However, if the clones are kept around for lots
of rgrps, then that is a waste of space. The question is really what
the correct balance is.

Can we not solve the problem at source and prevent the large number of
lock transitions referred to above? If not then it might be a good plan
to document why that is the case,

Steve.

> We only need to free the clone bitmaps when the glock is invalidated
> (i.e. when transitioning the glock to UN or DF so another node's view
> is consistent.) However, we still need to re-sync the clones with the
> real bitmap. This patch allows rgrp bitmaps to stick around until we
> have an invalidate of the glock. So in short:
>=20
> 1. SH->EX (for unlink or other)
> 2. Only the first time, allocate (kmalloc) a clone bitmap.
> 3. Free the bits in original bitmap.
> 4. Keep original state in the clone bitmap to prevent re-allocation
> =C2=A0=C2=A0 until the last user closes the file.
> 5. EX->SH
> 6. Sync bitmap to storage media.
> 7. Go to 1.
>=20
> Other transitions, like EX->UN still sync and free the clone bitmaps.
> And, of course, transition from SH->EX cannot have dirty buffers, so
> will not have clone bitmaps.
>=20
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
> =C2=A0fs/gfs2/glops.c |=C2=A0 4 +++-
> =C2=A0fs/gfs2/rgrp.c=C2=A0 | 13 +++++++++++++
> =C2=A0fs/gfs2/rgrp.h=C2=A0 |=C2=A0 1 +
> =C2=A03 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 01d433ed6ce7..58cf2004548e 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -205,7 +205,8 @@ static int rgrp_go_sync(struct gfs2_glock *gl)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error =3D gfs2_rgrp_metas=
ync(gl);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!error)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0error =3D gfs2_ail_empty_gl(gl);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gfs2_free_clones(rgd);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!test_bit(GLF_INVALIDATE_I=
N_PROGRESS, &gl->gl_flags))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0gfs2_sync_clones(rgd);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return error;
> =C2=A0}
> =C2=A0
> @@ -229,6 +230,7 @@ static void rgrp_go_inval(struct gfs2_glock *gl,
> int flags)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!rgd)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gfs2_free_clones(rgd);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start =3D (rgd->rd_addr *=
 bsize) & PAGE_MASK;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0end =3D PAGE_ALIGN((rgd->=
rd_addr + rgd->rd_length) * bsize) -
> 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gfs2_rgrp_brelse(rgd);
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 3b9b76e980ad..6e212e0eb74e 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -616,6 +616,19 @@ void gfs2_free_clones(struct gfs2_rgrpd *rgd)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> +void gfs2_sync_clones(struct gfs2_rgrpd *rgd)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int x;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (x =3D 0; x < rgd->rd_leng=
th; x++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct gfs2_bitmap *bi =3D rgd->rd_bits + x;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (bi->bi_clone)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(bi=
->bi_clone + bi->bi_offset,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bi->bi_bh->b_data + bi->bi_offset,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bi->bi_bytes);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> =C2=A0static void dump_rs(struct seq_file *seq, const struct
> gfs2_blkreserv *rs,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *fs_id_buf)
> =C2=A0{
> diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
> index 00b30cf893af..254188cf2d7b 100644
> --- a/fs/gfs2/rgrp.h
> +++ b/fs/gfs2/rgrp.h
> @@ -32,6 +32,7 @@ extern void gfs2_clear_rgrpd(struct gfs2_sbd *sdp);
> =C2=A0extern int gfs2_rindex_update(struct gfs2_sbd *sdp);
> =C2=A0extern void gfs2_free_clones(struct gfs2_rgrpd *rgd);
> =C2=A0extern int gfs2_rgrp_go_instantiate(struct gfs2_glock *gl);
> +extern void gfs2_sync_clones(struct gfs2_rgrpd *rgd);
> =C2=A0extern void gfs2_rgrp_brelse(struct gfs2_rgrpd *rgd);
> =C2=A0
> =C2=A0extern struct gfs2_alloc *gfs2_alloc_get(struct gfs2_inode *ip);

