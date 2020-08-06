Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7423DAD3
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sGANmi+WhQfiRAuvCL+UdGinBfSubhnPBxOSKKbOU6o=;
	b=MW1zWtcD7OjgLKGVtYWSiW28a/XDgPmbp0kWNgPrMtNoSRdWomFYLUbKjp0ubAAlv4X8bC
	aB7PqADSdNxUZaK8Jqv186Ir1oIUQUF4iGs9k+Aep+lVct9YWh/9+h4h8nMESlHBqh+UzM
	aeP/6DDHpi69J7ur4lUtumGMeCn2FQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-4jSzAk8lMWiQDPPemgVRew-1; Thu, 06 Aug 2020 09:38:24 -0400
X-MC-Unique: 4jSzAk8lMWiQDPPemgVRew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F157101C8A9;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 609806FEDC;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D53E96939;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcJCm030671 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 080356111F; Thu,  6 Aug 2020 13:38:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4905C60BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:18 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:40 +0100
Message-Id: <20200806133807.111280-6-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/32] savemeta: Don't save bad xattr blocks
	twice
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This could only happen if the xattr block has a corrupt mh_type.

We've already saved the xattr block by the time we figure out that we
can't recognise its mh type so don't bother saving it again there.

Also relax mh type checking for the xattr blocks so that we save as much
of the (possibly corrupt) fs as possible. Just use the mh_type field to
decide whether to save indirect pointers or xattrs.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index b44e887e..10e3bcce 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -789,31 +789,15 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		}
 	}
 	if (inode->i_di.di_eattr) { /* if this inode has extended attributes */
-		struct gfs2_meta_header mh;
 		struct gfs2_buffer_head *lbh;
+		int mhtype;
 
 		lbh = bread(&sbd, inode->i_di.di_eattr);
-		save_block(sbd.device_fd, mfd, inode->i_di.di_eattr, iblk, NULL);
-		gfs2_meta_header_in(&mh, lbh->b_data);
-		if (mh.mh_magic == GFS2_MAGIC &&
-		    mh.mh_type == GFS2_METATYPE_EA)
+		save_block(sbd.device_fd, mfd, inode->i_di.di_eattr, iblk, &mhtype);
+		if (mhtype == GFS2_METATYPE_EA)
 			save_ea_block(mfd, lbh->b_data, iblk);
-		else if (mh.mh_magic == GFS2_MAGIC &&
-			 mh.mh_type == GFS2_METATYPE_IN)
+		else if (mhtype == GFS2_METATYPE_IN)
 			save_indirect_blocks(mfd, cur_list, lbh, iblk, 2, 2);
-		else {
-			if (mh.mh_magic == GFS2_MAGIC) /* if it's metadata */
-				save_block(sbd.device_fd, mfd, inode->i_di.di_eattr,
-				           iblk, NULL);
-			fprintf(stderr,
-				"\nWarning: corrupt extended "
-				"attribute at block %llu (0x%llx) "
-				"detected in inode %lld (0x%llx).\n",
-				(unsigned long long)inode->i_di.di_eattr,
-				(unsigned long long)inode->i_di.di_eattr,
-				(unsigned long long)iblk,
-				(unsigned long long)iblk);
-		}
 		brelse(lbh);
 	}
 	inode_put(&inode);
-- 
2.26.2

