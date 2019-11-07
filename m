Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 06B5EF3826
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Nov 2019 20:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573153728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1uPlwQcWQROa+rtu+OQv1yciKRb0mPN2CSK4RHUdwnU=;
	b=DU/7NyYkyR+K0Ay4Z2QAABPObQCP4d7zvIYcmU9hfWcW3fG/0WSwLLwcFF6XLaC/QGQgwF
	BAi18P+bJ9fuDxT0Wm0NGS/mPE5C9x5JN3d8nP8vYy5PWtqTzqL61EiS/1e+dIKLZbAz5O
	sB1imSLWSZoaw55sh6kDmlF9WjDmnlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-svTx9nouMeGC_4B0C43UcA-1; Thu, 07 Nov 2019 14:08:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA83A1800D7B;
	Thu,  7 Nov 2019 19:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61A31100164D;
	Thu,  7 Nov 2019 19:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3FC64BB65;
	Thu,  7 Nov 2019 19:08:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7J8cBF012598 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:08:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BB26F5D70D; Thu,  7 Nov 2019 19:08:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.157])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 233E55D6B7
	for <cluster-devel@redhat.com>; Thu,  7 Nov 2019 19:08:37 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Nov 2019 19:08:27 +0000
Message-Id: <20191107190827.14169-3-anprice@redhat.com>
In-Reply-To: <20191107190827.14169-1-anprice@redhat.com>
References: <20191107190827.14169-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/3] fsck.gfs2: Clear bad indirect block
	pointers when bitmap meets expectations
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
X-MC-Unique: svTx9nouMeGC_4B0C43UcA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

This issue only occurs when an indirect pointer of a 'system' directory
points to an invalid block but the block's bitmap state is as expected.
If the block's state is not as expected, the corruption is fixed by an
earlier check.

In this scenario, pass1_check_metalist() checks the type of a block and
compares it with what it expected the indirect pointer to point to. If
there is a metadata mismatch a bad indirect pointer is reported but the
entire inode is considered invalid, causing it to be removed later, or
rebuilt in the case of protected structures such as the root inode.
This is heavy-handed and the right thing to do is to zero the indirect
block pointer.

Previously we had no access to the pointer block itself to update it in
pass1_check_metalist() but now that an iptr is passed in, it's just a
case of zeroing the pointer at the correct offset and marking the bh as
modified. This means that fsck.gfs2 can now fix bad indirect pointers of
the root directory without throwing away the entire directory tree.

Resolves: rhbz#1487726

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass1.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 9f211eb6..437ceeec 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -401,8 +401,15 @@ static int pass1_check_metalist(struct iptr iptr, stru=
ct gfs2_buffer_head **bh,
 =09=09=09 (unsigned long long)ip->i_di.di_num.no_addr,
 =09=09=09 (unsigned long long)block,
 =09=09=09 (unsigned long long)block, blktypedesc);
-=09=09brelse(nbh);
-=09=09return meta_skip_further;
+=09=09if (query(_("Zero the indirect block pointer? (y/n) "))){
+=09=09=09*iptr_ptr(iptr) =3D 0;
+=09=09=09bmodified(iptr.ipt_bh);
+=09=09=09*is_valid =3D 1;
+=09=09=09return meta_skip_one;
+=09=09} else {
+=09=09=09brelse(nbh);
+=09=09=09return meta_skip_further;
+=09=09}
 =09}
=20
 =09bc->indir_count++;
--=20
2.21.0

