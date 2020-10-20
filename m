Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF318294427
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 22:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603227501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FgP8YChdI46gYLYMilbrfx1+J7D5IFWootMY32XZmyY=;
	b=RNQ2S/BGJiMK72yJGV+cniWXb+Rk4sSihUxZ5WsGpUAfZBA1OdYsfqKA+QIhDrAdaicoAw
	9z6h+2TO1DzYlNiKQV7EV778/+nu9mt/tbTRWELvtwuGydVaS58TwmY5cC8ulhLvmdg64J
	L6RGGz482+ZeJDWoUuHBoEoWkXBBtJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-REb1cEddNCOvQTLnZVpeLg-1; Tue, 20 Oct 2020 16:58:19 -0400
X-MC-Unique: REb1cEddNCOvQTLnZVpeLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BFA01087D67;
	Tue, 20 Oct 2020 20:58:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5FD5B4B3;
	Tue, 20 Oct 2020 20:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A1BE180B658;
	Tue, 20 Oct 2020 20:58:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KKw9ne004633 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 16:58:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6249D55771; Tue, 20 Oct 2020 20:58:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33DAC55770
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 20:58:06 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 20 Oct 2020 15:58:02 -0500
Message-Id: <20201020205805.5705-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 0/3] gfs2: local statfs improvements
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patchset allows gfs2 to sync statfs info from the journal to the
master statfs file during a log flush or during recovery. We still
write to the local statfs file to allow older versions to recover the
statfs info of newer kernels with this patchset.

This version addresses the bug Andreas found with xfstests:generic/034.
Turns out we weren't looking up the statfs inodes early enough in the
mount process. I also added some comments in the code.

Abhi Das (3):
  gfs2: Add fields for statfs info in struct gfs2_log_header_host
  gfs2: lookup local statfs inodes prior to journal recovery
  gfs2: Recover statfs info in journal head

 fs/gfs2/incore.h     |  12 ++++
 fs/gfs2/lops.c       |   2 +-
 fs/gfs2/lops.h       |   1 +
 fs/gfs2/ops_fstype.c | 133 +++++++++++++++++++++++++++++++------------
 fs/gfs2/recovery.c   | 108 +++++++++++++++++++++++++++++++++++
 fs/gfs2/super.c      |  33 ++++++++++-
 fs/gfs2/super.h      |   5 ++
 7 files changed, 256 insertions(+), 38 deletions(-)

-- 
2.20.1

