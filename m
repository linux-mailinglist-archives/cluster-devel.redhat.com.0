Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C07D428D161
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Oct 2020 17:40:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-QCDjBirINceezIEPoULCcA-1; Tue, 13 Oct 2020 11:40:35 -0400
X-MC-Unique: QCDjBirINceezIEPoULCcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 574F8106B31F;
	Tue, 13 Oct 2020 15:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35A656EF7E;
	Tue, 13 Oct 2020 15:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A15685811E;
	Tue, 13 Oct 2020 15:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DFR62B025658 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 11:27:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C9661041D7F; Tue, 13 Oct 2020 15:27:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0845E1041D78
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 15:27:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F301021F94
	for <cluster-devel@redhat.com>; Tue, 13 Oct 2020 15:27:03 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-546-2nCvfHepNgKOXdfcT3Y7Yw-1; Tue, 13 Oct 2020 11:26:59 -0400
X-MC-Unique: 2nCvfHepNgKOXdfcT3Y7Yw-1
Received: by mail-pl1-f194.google.com with SMTP id p11so2040pld.5;
	Tue, 13 Oct 2020 08:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=59HsEt/qRATYcWGWkuFwFGhFUgu5MJlwW4EIEwWX704=;
	b=JbeyWCqP6MfpQa4Cd1pl1B1e6L67Ss4OUuSWFYvqpZgW2J/JVJOSsPBzpZ/UG/ftDy
	AJz63joIu8vjilQs23XJZjQziedosAyy5z3P0MSNlunk3VQGCZqrLSL9Sn81bvCnjvNA
	mAlviNmR2c9gfKGABvYFlNoQbVQXZ/3zyh3UQy/S9MGpfTYV2GAvwM5jnNLXkur2fI4F
	iZjWKpA6puRXdJbbQiVnSnEnaT1kku1zePx6brmYlNpneW8+hw/hgs/VSP4ukFuB2tNZ
	WPJ2ubzRkxCzGZjYLrnlPMAmtfEDRgPKZ/FoYJrNq+wxiU5MiqCLnx+ywKsmq0Dp2wVj
	nOfg==
X-Gm-Message-State: AOAM531VTjDgkIQczbifcUrCUpN3RBvTEwURQwFWpFDMCBqF1ENwP387
	Xfp8oP/QSPBSGtpri6XEzVVmtAvgjpWWk3KG
X-Google-Smtp-Source: ABdhPJxxkc2XNHdUqAyT+6mTSLMdWeQ+/wMyG2H1zQOiyaZ972G084d2ZeNANQpUZBGYnk25yE4X5g==
X-Received: by 2002:a17:902:8c8b:b029:d2:42fe:370a with SMTP id
	t11-20020a1709028c8bb02900d242fe370amr20231plo.83.1602602816797;
	Tue, 13 Oct 2020 08:26:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.44])
	by smtp.gmail.com with ESMTPSA id
	78sm23768794pfz.211.2020.10.13.08.26.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Oct 2020 08:26:56 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Date: Tue, 13 Oct 2020 20:56:48 +0530
Message-Id: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 13 Oct 2020 11:40:15 -0400
Cc: cluster-devel@redhat.com, anant.thazhemadam@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Subject: [Cluster-devel] [PATCH] fs: gfs2: prevent OOB access in
	gfs2_read_sb()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In gfs2_read_sb(), if the condition
	(d != sdp->sd_heightsize[x - 1] || m)
isn't satisfied (in the first 11 iterations), the loop continues,
and begins to perform out-of-bounds access.
Fix this out-of-bounds access by introducing a condition in the for loop
that ensures that no more than GFS2_MAX_META_HEIGHT + 1 elements are
accessed.

In addition to this, if the above condition is satisfied when
x = GFS2_MAX_META_HEIGHT (which = 10), and the flow of control breaks
out of the loop, then an out-of-bounds access is performed again while
assigning sdp->sd_heightsize[x] = ~0 (since x would be 11 now.), and
also the assertion that spd->sd_max_height <= GFS2_MAX_META_HEIGHT would
fail.
Fix this out-of-bounds access and ensure that the assertion doesn't fail
by introducing another variable "index", which keeps track of the last
valid value of x (pre-increment) that can be used.

Reported-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Tested-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---

I have one question here (potentially a place where I suspect this
patch could have a fatal flaw and might need some rework).

	sdp->sd_max_height = x;
	sdp->sd_heightsize[x] = ~0;

Were these lines written with the logic that the value of x would be
equal to (sdp->sd_heightsize[]'s last index filled in by the loop) + 1?
Or, is the expected value of x at these lines equal to 
(sdp->sd_heightsize[]'s last index as filled in by the loop)?
I would appreciate it if someone could clarify for me, how this would 
hold against the second potential out-of-bounds access I mentioned in my
commit message.

An additional comment (which I feel is of some significance) on this.
Reproducing the crash locally, I could infer that sdp->sd_fsb2bb_shift
sdp->sd_sb.sb_bsize, sdp->sd_sb.sb_bsize_shift, and sdp->sd_inptrs
were all 0.
This by extension also means that in gfs2_read_sb(), all the attributes
whose values were determined by performing some sort of calculation 
involving any one of these variables all resulted in either 0 or a 
negative value.
Simply doing the math will also show how this was also the primary reason
this OOB access occured in the first place. 
However, I still feel that gfs2_read_sb() could do with this bit of checking, 
since it fundamentally prevents OOB accesses from occuring in gfs2_read_sb()
in all scenarios.
Anyways, coming back to my initial point. Can having values like that be 
considered unacceptable and as something that needs to be handled (at 
gfs2_fill_super() maybe?) or is this non-anomalous behaviour and okay?

 fs/gfs2/ops_fstype.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..66ee8fb06ab9 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -281,7 +281,7 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 {
 	u32 hash_blocks, ind_blocks, leaf_blocks;
 	u32 tmp_blocks;
-	unsigned int x;
+	unsigned int x, index;
 	int error;
 
 	error = gfs2_read_super(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift, silent);
@@ -329,20 +329,21 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 	sdp->sd_heightsize[0] = sdp->sd_sb.sb_bsize -
 				sizeof(struct gfs2_dinode);
 	sdp->sd_heightsize[1] = sdp->sd_sb.sb_bsize * sdp->sd_diptrs;
-	for (x = 2;; x++) {
+	for (x = 2; x <= GFS2_MAX_META_HEIGHT; x++) {
 		u64 space, d;
 		u32 m;
 
-		space = sdp->sd_heightsize[x - 1] * sdp->sd_inptrs;
+		index = x;
+		space = sdp->sd_heightsize[index - 1] * sdp->sd_inptrs;
 		d = space;
 		m = do_div(d, sdp->sd_inptrs);
 
-		if (d != sdp->sd_heightsize[x - 1] || m)
+		if (d != sdp->sd_heightsize[index - 1] || m)
 			break;
-		sdp->sd_heightsize[x] = space;
+		sdp->sd_heightsize[index] = space;
 	}
-	sdp->sd_max_height = x;
-	sdp->sd_heightsize[x] = ~0;
+	sdp->sd_max_height = index;
+	sdp->sd_heightsize[index] = ~0;
 	gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT);
 
 	sdp->sd_max_dents_per_leaf = (sdp->sd_sb.sb_bsize -
-- 
2.25.1

