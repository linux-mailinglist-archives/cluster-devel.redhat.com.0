Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E2952A1B7
	for <lists+cluster-devel@lfdr.de>; Tue, 17 May 2022 14:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652791267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dRK9K63kXBsABUM2AO+h3kImVtdqE+e9mXVUubeP2TM=;
	b=Rs7mnZnFLTUpxsyw+m9QMK+S8LjR2eHABkOgKiGr+6r7vIISii4IMY1P+rhQN9m9CAcPFx
	6cNS9dM37PSDV26WjirZWHC4sjV+GNckzznxwz5uKUhqjIfbvbCV1MEpnnK/iyXKi8nCRH
	ApoACtd0BlctkI3FlGQ/a/abGbruIRA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-KfseXnbQNpeHSHvfyAxwRQ-1; Tue, 17 May 2022 08:41:04 -0400
X-MC-Unique: KfseXnbQNpeHSHvfyAxwRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D50A43C11726;
	Tue, 17 May 2022 12:41:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93DA87774;
	Tue, 17 May 2022 12:41:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38523194707B;
	Tue, 17 May 2022 12:41:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A47CB194705F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 17 May 2022 12:40:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7939E40336A; Tue, 17 May 2022 12:40:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0D9E403151;
 Tue, 17 May 2022 12:40:58 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>
Date: Tue, 17 May 2022 14:40:57 +0200
Message-Id: <20220517124057.176744-1-agruenba@redhat.com>
In-Reply-To: <20220211155151.108646-1-rpeterso@redhat.com>
References: <20220211155151.108646-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH] *
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi Bob,=0D
=0D
On Fri, Feb 11, 2022 at 4:51 PM Bob Peterson <rpeterso@redhat.com> wrote:=
=0D
> Before this patch quota function bh_get called gfs2_iomap_get after it=0D
> had locked the sd_quota_mutex. That's a problem because that holds the=0D
> i_rw_mutex, and that lock order is different from other code that=0D
> locks i_rw_mutex first, then the sd_quota_mutex:=0D
=0D
I see the problem, but the patch is pretty awful.  Can you resend based=0D
on the following suggestion?=0D
=0D
Thanks,=0D
Andreas=0D
=0D
---=0D
 fs/gfs2/quota.c | 39 ++++++++++++++++++---------------------=0D
 1 file changed, 18 insertions(+), 21 deletions(-)=0D
=0D
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c=0D
index 59d727a4ae2c..58fe5377d589 100644=0D
--- a/fs/gfs2/quota.c=0D
+++ b/fs/gfs2/quota.c=0D
@@ -370,14 +370,12 @@ static int bh_get(struct gfs2_quota_data *qd)=0D
 =09unsigned int block, offset;=0D
 =09struct buffer_head *bh;=0D
 =09struct iomap iomap =3D { };=0D
-=09int error;=0D
+=09int error =3D 0;=0D
=20=0D
 =09mutex_lock(&sdp->sd_quota_mutex);=0D
-=0D
-=09if (qd->qd_bh_count++) {=0D
-=09=09mutex_unlock(&sdp->sd_quota_mutex);=0D
-=09=09return 0;=0D
-=09}=0D
+=09if (qd->qd_bh_count)=0D
+=09=09goto inc_out;=0D
+=09mutex_unlock(&sdp->sd_quota_mutex);=0D
=20=0D
 =09block =3D qd->qd_slot / sdp->sd_qc_per_block;=0D
 =09offset =3D qd->qd_slot % sdp->sd_qc_per_block;=0D
@@ -386,32 +384,31 @@ static int bh_get(struct gfs2_quota_data *qd)=0D
 =09=09=09       (loff_t)block << inode->i_blkbits,=0D
 =09=09=09       i_blocksize(inode), &iomap);=0D
 =09if (error)=0D
-=09=09goto fail;=0D
-=09error =3D -ENOENT;=0D
+=09=09return error;=0D
 =09if (iomap.type !=3D IOMAP_MAPPED)=0D
-=09=09goto fail;=0D
+=09=09return -ENOENT;=0D
=20=0D
 =09error =3D gfs2_meta_read(ip->i_gl, iomap.addr >> inode->i_blkbits,=0D
 =09=09=09       DIO_WAIT, 0, &bh);=0D
 =09if (error)=0D
-=09=09goto fail;=0D
-=09error =3D -EIO;=0D
-=09if (gfs2_metatype_check(sdp, bh, GFS2_METATYPE_QC))=0D
-=09=09goto fail_brelse;=0D
+=09=09return error;=0D
+=09if (gfs2_metatype_check(sdp, bh, GFS2_METATYPE_QC)) {=0D
+=09=09brelse(bh);=0D
+=09=09return -EIO;=0D
+=09}=0D
=20=0D
+=09mutex_lock(&sdp->sd_quota_mutex);=0D
+=09if (qd->qd_bh_count) {=0D
+=09=09brelse(bh);=0D
+=09=09goto inc_out;=0D
+=09}=0D
 =09qd->qd_bh =3D bh;=0D
 =09qd->qd_bh_qc =3D (struct gfs2_quota_change *)=0D
 =09=09(bh->b_data + sizeof(struct gfs2_meta_header) +=0D
 =09=09 offset * sizeof(struct gfs2_quota_change));=0D
=20=0D
-=09mutex_unlock(&sdp->sd_quota_mutex);=0D
-=0D
-=09return 0;=0D
-=0D
-fail_brelse:=0D
-=09brelse(bh);=0D
-fail:=0D
-=09qd->qd_bh_count--;=0D
+inc_out:=0D
+=09qd->qd_bh_count++;=0D
 =09mutex_unlock(&sdp->sd_quota_mutex);=0D
 =09return error;=0D
 }=0D
--=20=0D
2.35.1=0D
=0D

