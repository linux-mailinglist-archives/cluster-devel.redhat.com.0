Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3E1277EAD
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Sep 2020 05:46:43 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601005602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o8RzEpO83zafQVVJMjrWlt4DulhtOEbzgUl1MS2oS7E=;
	b=Ho3ttcimwHhw1neysckMPJ/RXVhmXYUkBEss1jjNOxsIs9Vo2XsyeQZ80Lm4SKRlOjFGbT
	jD+EDk+Ps5qF6nQe5dHs19MSTfrA0HXPRjbN5E51btiEoBk3tK+dxFu1tKw6npu/FUVdF1
	mOnl59DAZjjkDtysYgsMoMRhtZ/54V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-ZBNW3OxyOMexEPVHsHE0sA-1; Thu, 24 Sep 2020 23:46:39 -0400
X-MC-Unique: ZBNW3OxyOMexEPVHsHE0sA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40811074664;
	Fri, 25 Sep 2020 03:46:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9915710013DB;
	Fri, 25 Sep 2020 03:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49D1A180B655;
	Fri, 25 Sep 2020 03:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P3kTFK028411 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 23:46:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D984B78810; Fri, 25 Sep 2020 03:46:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AADBB702E7
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 03:46:26 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Sep 2020 22:46:22 -0500
Message-Id: <20200925034625.56517-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 0/3] gfs2: local statfs improvements
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

Abhi Das (3):
  gfs2: Add fields for statfs info in struct gfs2_log_header_host
  gfs2: lookup local statfs inodes at mount time
  gfs2: Recover statfs info in journal head

 fs/gfs2/incore.h     | 11 +++++++
 fs/gfs2/lops.c       |  2 +-
 fs/gfs2/lops.h       |  1 +
 fs/gfs2/ops_fstype.c | 32 ++++++++++++++-----
 fs/gfs2/recovery.c   | 75 ++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/super.c      | 30 ++++++++++++++++--
 fs/gfs2/super.h      |  5 +++
 7 files changed, 145 insertions(+), 11 deletions(-)

-- 
2.20.1

