Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 00E8B21A773
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 21:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594321490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bwLFjtV+z9UBHajBwX3aBiT5+pHKqJ4Tht7xLpbzkCM=;
	b=GUSwwhcGnU0MU4s5c4f4ANM6Lhgx77uN0gtTLvJ+XdcJBiNnma8Jn2oljR43IAQekSdCH2
	RgETXnfCK5zimvjg2hsEeANzCXMEQL5adLk/ZewGY4r+u7QDQYeJm4h9RpJ1ELV0KXZ9gh
	G4Gc3jL8bZ5oQM6R6LZ4tZRT0aIfFXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-7ujh3CR9MJiY7CjtdmsFZg-1; Thu, 09 Jul 2020 15:04:47 -0400
X-MC-Unique: 7ujh3CR9MJiY7CjtdmsFZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3AD980BCA1;
	Thu,  9 Jul 2020 19:04:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9543860E1C;
	Thu,  9 Jul 2020 19:04:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E88DE84352;
	Thu,  9 Jul 2020 19:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069J0TLI025592 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 15:00:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D972573FF9; Thu,  9 Jul 2020 19:00:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA205BACF;
	Thu,  9 Jul 2020 19:00:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 14:59:58 -0400
Message-Id: <20200709190001.102450-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 0/3] dlm_controld: changes from v2
	to v3
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

series v2 got applied and my changes for series v3 got dropped. I
created this patch series now to sync upstream with the previous v3
series. Every change is now splitted in a separate patch.

Thank you.

- Alex

Alexander Aring (3):
  dlm_controld: don't abort node configuration
  dlm_controld: change enable_waitplock_recovery default
  dlm_controld: add default value handling for unsigned int

 dlm_controld/action.c     |  7 ++++-
 dlm_controld/dlm_daemon.h |  1 +
 dlm_controld/main.c       | 61 +++++++++++++++++++++------------------
 3 files changed, 40 insertions(+), 29 deletions(-)

-- 
2.26.2

