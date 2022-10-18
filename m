Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF07601EBB
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Oct 2022 02:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666051960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uRwMiAa5NkGmsC/diw2WVJkFH4IeZ8IItn5uAgn7fYY=;
	b=CLufSCvbuU/QVsRkW5dljwVYHGzQHXXZAD0QSTfd39Ba3PNAR5KCADC+PffndMaHbdU0m/
	pZjc/oIrpGkJLGsPNlBqr+gFCuZ84xS9mKhzcN/A+W76EVdn9QWlRJN8oyU7fx0qeBmWz5
	N/kP19gOwMdqyTMmg+2CbEbjuOX/FFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-5ahQ9f1fM26acn3s_8CN2w-1; Mon, 17 Oct 2022 20:12:36 -0400
X-MC-Unique: 5ahQ9f1fM26acn3s_8CN2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36DDA1C0878D;
	Tue, 18 Oct 2022 00:12:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC9022166B33;
	Tue, 18 Oct 2022 00:12:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 180D01946597;
	Tue, 18 Oct 2022 00:12:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3AC41194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Oct 2022 00:12:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E768914657CB; Tue, 18 Oct 2022 00:12:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF0B014657C8
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:12:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE69A101E148
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 00:12:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-50d19Fk6NXGHS12nVz4inA-1; Mon, 17 Oct 2022 20:12:12 -0400
X-MC-Unique: 50d19Fk6NXGHS12nVz4inA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F202B81BFD;
 Tue, 18 Oct 2022 00:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA58C433C1;
 Tue, 18 Oct 2022 00:12:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:11:57 -0400
Message-Id: <20221018001202.2732458-3-sashal@kernel.org>
In-Reply-To: <20221018001202.2732458-1-sashal@kernel.org>
References: <20221018001202.2732458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 3/8] gfs2: Check sb_bsize_shift
 after reading superblock
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
 syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andrew Price <anprice@redhat.com>

[ Upstream commit 670f8ce56dd0632dc29a0322e188cc73ce3c6b92 ]

Fuzzers like to scribble over sb_bsize_shift but in reality it's very
unlikely that this field would be corrupted on its own. Nevertheless it
should be checked to avoid the possibility of messy mount errors due to
bad calculations. It's always a fixed value based on the block size so
we can just check that it's the expected value.

Tested with:

    mkfs.gfs2 -O -p lock_nolock /dev/vdb
    for i in 0 -1 64 65 32 33; do
        gfs2_edit -p sb field sb_bsize_shift $i /dev/vdb
        mount /dev/vdb /mnt/test && umount /mnt/test
    done

Before this patch we get a withdraw after

[   76.413681] gfs2: fsid=3Dloop0.0: fatal: invalid metadata block
[   76.413681]   bh =3D 19 (type: exp=3D5, found=3D4)
[   76.413681]   function =3D gfs2_meta_buffer, file =3D fs/gfs2/meta_io.c,=
 line =3D 492

and with UBSAN configured we also get complaints like

[   76.373395] UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:295:19
[   76.373815] shift exponent 4294967287 is too large for 64-bit type 'long=
 unsigned int'

After the patch, these complaints don't appear, mount fails immediately
and we get an explanation in dmesg.

Reported-by: syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com
Signed-off-by: Andrew Price <anprice@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/ops_fstype.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 0e6fa91f4c8f..55daf740ab8d 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -171,7 +171,10 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int sil=
ent)
 =09=09pr_warn("Invalid superblock size\n");
 =09=09return -EINVAL;
 =09}
-
+=09if (sb->sb_bsize_shift !=3D ffs(sb->sb_bsize) - 1) {
+=09=09pr_warn("Invalid block size shift\n");
+=09=09return -EINVAL;
+=09}
 =09return 0;
 }
=20
--=20
2.35.1

