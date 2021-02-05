Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C03BD310E57
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 18:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612545040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6o3oHpU8oRG8+aIOoSNCNncP/C2IOnnHgJMCA3BnF50=;
	b=O9BOW4CQ9ToUaViLGqY/kVI8btvFfZAzvbGM7QbgAau0gaHRLLHAUtOCBoCWt3aF4XEoRC
	VDqY3xmY6cql9ElRT0rCHsTxRz6NWXOYfycSACOOJ09IVdzi8LC/5eXZrUGcBEY/jOdWvo
	5bXUK8/eGeF7OXprUF73mb7DoBzbxiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-9y-quqpdP3eA4m2k8OkuGw-1; Fri, 05 Feb 2021 12:10:35 -0500
X-MC-Unique: 9y-quqpdP3eA4m2k8OkuGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD9D801978;
	Fri,  5 Feb 2021 17:10:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA1760C5D;
	Fri,  5 Feb 2021 17:10:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C9FE18095CB;
	Fri,  5 Feb 2021 17:10:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115HAOVB000623 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 12:10:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB90A5C261; Fri,  5 Feb 2021 17:10:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 499135C1B4
	for <cluster-devel@redhat.com>; Fri,  5 Feb 2021 17:10:20 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  5 Feb 2021 17:10:16 +0000
Message-Id: <20210205171018.1677127-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/2] gfs2: fs format 1802 features
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

These patches add trusted.* xattr support and switch on rgrplvb by default when the sb_fs_format field is greater than 1801 (the current version). Filesystems with an 1802 fs format can currently be created with gfs2-utils.git/master using -o format=1802 but that will become the default once this has had some soak time.

I've tested the patches with several rounds of xfstests single-node, and in a clustered configuration with a lot of file operations happening on each node, including filling the fs to force resource group contention.

Andreas Gruenbacher (1):
  gfs2: Add trusted xattr support

Andrew Price (1):
  gfs2: Enable rgrplvb for sb_fs_format 1802

 fs/gfs2/incore.h                 |  1 +
 fs/gfs2/ops_fstype.c             | 27 +++++++++++++++---
 fs/gfs2/super.h                  |  8 +++++-
 fs/gfs2/xattr.c                  | 48 +++++++++++++++++++++++++++++---
 include/uapi/linux/gfs2_ondisk.h |  5 ++--
 5 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.29.2

