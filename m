Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0C2945E7
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Oct 2020 02:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603239481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cfyw6v3vfgXSOko9QyhNmlMxkxZDP3eLxNX0E4n40oU=;
	b=HNPHVaJtH1ePsIX8p4JeJHI2vUIUhmlNJm6gP5wIRCeZiKwC0xHRTwtnbFaxg2Dvm5JbHC
	+9KKU1ts+W13zJNc79VOLJUbpBXdZ6nm4j3fuuvwgwRm8mFPok9xJKzqLuChQDxjiX4dsF
	fQeqMhrbLYHKVecUP+oMGz2QrGS3Dy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-J5RWBcapO3eNO3yc4UIrCA-1; Tue, 20 Oct 2020 20:17:59 -0400
X-MC-Unique: J5RWBcapO3eNO3yc4UIrCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9D8A640AE;
	Wed, 21 Oct 2020 00:17:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6635128545;
	Wed, 21 Oct 2020 00:17:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AB381800BB2;
	Wed, 21 Oct 2020 00:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09L0HmmF022394 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 20:17:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CCDC60FC2; Wed, 21 Oct 2020 00:17:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98BF860C13;
	Wed, 21 Oct 2020 00:17:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 20:17:36 -0400
Message-Id: <20201021001739.1689219-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/3] fs: dlm: node address
	configuration fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

I got reports of:

kernel: dlm: TCP protocol can't handle multi-homed hosts, try SCTP

there was some reconfiguration involed and my guess it that we
left some dlm_local_addr array pointers in some dangled state. The
first patch should fix the observed behaviour. The other patches is
something what I thought can also happen, it just checks if we
setup a node address twice, if this is the case we return -EEXIST.

This is based on dlm/next with the previous submitted patch series.

- Alex

changes since v2:
 - remove deadlock situation in 3/3
 - fix grammar in 1/3 commit msg

Alexander Aring (3):
  fs: dlm: cleanup dlm_local_addr properly
  fs: dlm: constify addr_compare
  fs: dlm: check on existing node address

 fs/dlm/lowcomms.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

-- 
2.26.2

