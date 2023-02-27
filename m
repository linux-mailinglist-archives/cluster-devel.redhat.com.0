Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D26A3803
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Feb 2023 03:14:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677464039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pukJumXE2Utz3TX7u3UshMCcbOQrHB6O+eU0AhpPQyI=;
	b=fu5mZbWOobzxBhhIVDtFvCDI+pZZdMn20+QbPQSsDLI1NkHI6nHOUhAW810cN/427xWWnB
	GzoKQwqAX0ZbLPpE+yrTxQk5WT/pJsGRQ0533+6+u+S4LqxCrAdaTUxgYaqriSATOgt5nm
	Lwi8Qqf4uTmThUjamRPTkBrjlgPQHzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-JRCYZ4Q-NaySSpoEWaI2Fw-1; Sun, 26 Feb 2023 21:13:53 -0500
X-MC-Unique: JRCYZ4Q-NaySSpoEWaI2Fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AD2F183B3C0;
	Mon, 27 Feb 2023 02:13:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A699C15BAD;
	Mon, 27 Feb 2023 02:13:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D31BC19465A4;
	Mon, 27 Feb 2023 02:13:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 436151946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Feb 2023 02:13:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDC652026D68; Mon, 27 Feb 2023 02:13:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2472026D4B
 for <cluster-devel@redhat.com>; Mon, 27 Feb 2023 02:13:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5BAA882820
 for <cluster-devel@redhat.com>; Mon, 27 Feb 2023 02:13:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-gsg6-nBVNr-9hBiCUN3_nQ-1; Sun, 26 Feb 2023 21:13:38 -0500
X-MC-Unique: gsg6-nBVNr-9hBiCUN3_nQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE833B80CB8;
 Mon, 27 Feb 2023 02:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A4FC433EF;
 Mon, 27 Feb 2023 02:07:26 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 26 Feb 2023 21:04:37 -0500
Message-Id: <20230227020457.1048737-39-sashal@kernel.org>
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH AUTOSEL 6.1 39/58] gfs2: Improve
 gfs2_make_fs_rw error handling
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
Cc: Sasha Levin <sashal@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 syzbot+f51cb4b9afbd87ec06f2@syzkaller.appspotmail.com,
 cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit b66f723bb552ad59c2acb5d45ea45c890f84498b ]

In gfs2_make_fs_rw(), make sure to call gfs2_consist() to report an
inconsistency and mark the filesystem as withdrawn when
gfs2_find_jhead() fails.

At the end of gfs2_make_fs_rw(), when we discover that the filesystem
has been withdrawn, make sure we report an error.  This also replaces
the gfs2_withdrawn() check after gfs2_find_jhead().

Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot+f51cb4b9afbd87ec06f2@syzkaller.appspotmail.com
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/super.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 011f9e7660ef8..2015bd05cba10 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -138,8 +138,10 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 =09=09return -EIO;
=20
 =09error =3D gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-=09if (error || gfs2_withdrawn(sdp))
+=09if (error) {
+=09=09gfs2_consist(sdp);
 =09=09return error;
+=09}
=20
 =09if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
 =09=09gfs2_consist(sdp);
@@ -151,7 +153,9 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 =09gfs2_log_pointers_init(sdp, head.lh_blkno);
=20
 =09error =3D gfs2_quota_init(sdp);
-=09if (!error && !gfs2_withdrawn(sdp))
+=09if (!error && gfs2_withdrawn(sdp))
+=09=09error =3D -EIO;
+=09if (!error)
 =09=09set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 =09return error;
 }
--=20
2.39.0

