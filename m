Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1500429B786
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Oct 2020 16:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603813239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sgY6QEEs/hhmaIETfiXMAE/DzzHz0tPsfmrJ1vCZnSs=;
	b=alrk0B5Y4pQWne2SMQ+FoSCQOSBXL3cvkeCowAZBEVQ5o/1+76l8VdVcHbFWw/i4AziZCN
	9t6LU89nHRAuOMaT2foKTEf/YLSjmCDhJLVLtBxkwEuIOoF8GkD8ufkG2R4OiTmuqqXYuz
	wbyAU/LlAd36kN7EwfosNbt0PjzxVPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-QwqWKeOXNneGzFnAsRIzmg-1; Tue, 27 Oct 2020 11:40:37 -0400
X-MC-Unique: QwqWKeOXNneGzFnAsRIzmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89E11809DC9;
	Tue, 27 Oct 2020 15:40:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B66360C07;
	Tue, 27 Oct 2020 15:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52F251832FC2;
	Tue, 27 Oct 2020 15:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09RFA6SM008045 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 11:10:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEDF95B4BB; Tue, 27 Oct 2020 15:10:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-113-104.phx2.redhat.com [10.3.113.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 903EF5B4B2
	for <cluster-devel@redhat.com>; Tue, 27 Oct 2020 15:10:03 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 27 Oct 2020 10:10:00 -0500
Message-Id: <20201027151003.363949-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/3] gfs2: Fix 'dont sleep' GPF from vfs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This series of patches fixes problems discovered while testing patch
34244d711dea568f4a42c5b0d6b3d620f8cb6971 "Don't sleep during glock hash walk"
with various combinations of these xfstests under low memory conditions:

env SCRATCH_DEV="/dev/sda" SCRATCH_MNT="/mnt/scratch" TEST_DEV="/dev/sdb" TEST_DIR="/mnt/gfs2" ./check generic/076 generic/081 generic/224

and:

env SCRATCH_DEV="/dev/sda" SCRATCH_MNT="/mnt/scratch" TEST_DEV="/dev/sdb" TEST_DIR="/mnt/gfs2" ./check generic/0{34,35,38}

The bug led to "general protection fault, probably for non-canonical address"
errors called from either move_to_new_page() or shrink_page_list().
It was always a reference to an invalid address space pointer, page->mapping.

Bob Peterson (3):
  gfs2: Free rd_bits later in gfs2_clear-rgrpd to fix use-after-free
  gfs2: Add missing truncate_inode_pages_final for sd_aspace
  gfs2: Use filemap_fdatawrite_range for gfs2_meta_sync

 fs/gfs2/lops.c  | 14 +++++++++++---
 fs/gfs2/rgrp.c  |  2 +-
 fs/gfs2/super.c |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.26.2

