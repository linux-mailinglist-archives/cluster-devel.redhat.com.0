Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EC41121F8B0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 20:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594749708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cxSeNaJmOxQiEWyOGhwPQZoubf+t77pvO8cPWR+0B8w=;
	b=bX2o514morsCp1k3e5V6nQB/K9p3wXwD4MhzrNU0vjTOxfYBFtsZrBWGObw/jEHKzvrHG0
	BPkAehLZ4REMZhO2iLMGer0wW6Xd1AeNqv00wLy3Rh+1P25fPpEzApVT3BrnR6Fb0m4mZB
	P1txJnTbBbBwgQQRhNFvOl0jvg9ulBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-YhenU7XOOs2g9vqPpqaKgQ-1; Tue, 14 Jul 2020 14:01:46 -0400
X-MC-Unique: YhenU7XOOs2g9vqPpqaKgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2B4E108C1E1;
	Tue, 14 Jul 2020 18:01:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9503910013C0;
	Tue, 14 Jul 2020 18:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CFDC94EFA;
	Tue, 14 Jul 2020 18:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EI1c96024218 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 14:01:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 124C160CD0; Tue, 14 Jul 2020 18:01:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-142.rdu2.redhat.com [10.10.119.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A03660BF4;
	Tue, 14 Jul 2020 18:01:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jul 2020 14:01:12 -0400
Message-Id: <20200714180116.18642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 0/4] dlm_controld: gcc-10 compile
	warning fixes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this patch series contains fixes to avoid compile warnings for gcc
version 10.

There might be some points for code sharing which I ignored right now
and leave the code as it is.

Also I added a patch to more log functionality in cases that a key value
config entry isn't successful parsed.

- Alex

Alexander Aring (4):
  dlm_controld: fix -Wstringop-truncation warnings
  dlm_controld: fix may be used uninitialized
  dlm_controld: fix may be used uninitialized
  dlm_controld: get notice about failed config parse

 dlm_controld/config.c       | 14 ++++++++++----
 dlm_controld/cpg.c          |  3 ++-
 dlm_controld/daemon_cpg.c   |  4 ++--
 dlm_controld/fence_config.c | 20 +++++++++++++++-----
 dlm_controld/lib.c          | 15 +++++++++++++--
 dlm_controld/main.c         | 13 ++++++++++++-
 6 files changed, 54 insertions(+), 15 deletions(-)

-- 
2.26.2

