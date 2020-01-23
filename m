Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C1732146D8E
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ExB5Z94dSitEIl+KWsrlJG5v5Wveu+QVdXtdTJefLsg=;
	b=g7P8MxoVqZooEG+MbK3Pgstz9SqdeRYzy+4IzfODO3zUrXG05fpFuWewJ9drqoxftpGVUG
	Nl3qm8CFfjqu4yGX0gUsS8kVKjaV4vbp4QIMUyyZWjmyWTy9hMCB3eiAvSXjvRYislsT1d
	x45zrrAaLyWpjLDdxEMv1I5L+VBi0Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-soJGeRJTP7OfLbBwAp2RBg-1; Thu, 23 Jan 2020 10:56:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6DD9801E70;
	Thu, 23 Jan 2020 15:56:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B89588CCD9;
	Thu, 23 Jan 2020 15:56:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FD9F1832DEA;
	Thu, 23 Jan 2020 15:56:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFtxpX012296 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:55:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D23960C81; Thu, 23 Jan 2020 15:55:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F15860BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:55:55 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:39 +0000
Message-Id: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 00/13] gfs2_edit restoremeta: Add bzip2
	support
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
X-MC-Unique: soJGeRJTP7OfLbBwAp2RBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch set allows gfs2_edit restoremeta to read gfs2 metadata dumps tha=
t were compressed with bzip2.

In doing so, it speeds up reading of metadata files by around 45% based on =
this test:

  $ time while read f; do gfs2_edit printsavedmeta $f &>/dev/null; done < m=
etadata_files_for_comparison

Andrew Price (13):
  restoremeta: Use zlib by file descriptor
  restoremeta: Abstract out metadata file opening
  restoremeta: Use metafd instead of gzFile for parameters
  restoremeta: Abstract out decompression operations
  restoremeta: Combine restore_init() and open_metadata()
  restoremeta: Don't seek in restore_header()
  savemeta: Remove anthropomorphize()
  restoremeta: Remove find_highest_block()
  restoremeta: Metadata file reading overhaul
  restoremeta: Convert iseof function to a flag
  restoremeta: Combine parse_header() and check_header()
  restoremeta: Add bzip2 support
  restoremeta: Skip the right number of bytes for the superblock

 configure.ac          |   1 +
 gfs2/edit/Makefile.am |   2 +
 gfs2/edit/savemeta.c  | 413 ++++++++++++++++++++++++------------------
 tests/edit.at         |   2 +-
 4 files changed, 238 insertions(+), 180 deletions(-)

--=20
2.24.1

