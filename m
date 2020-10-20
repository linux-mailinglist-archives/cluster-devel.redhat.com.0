Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAB60294447
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 23:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603228211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+e4OSmqN6l1UGG0e7mdB8IgZjf5aon+Gg+qSeDzv0YU=;
	b=g+7l9IsINdvEWLU33+WPzdOAtTPDuS7AH4g4vzIt9hDmBKtuclk6rVsjsc9Q7+rkrtxpcI
	RPjXPK5K+EX9cTwAVd5fGcGmypaezbW/BC9xh1yRIHSylXT7ptOMuzC/+dzsgKf0f1BTvD
	RIco4Fag+xqkQhf7JvD3GcLblyKnvSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-cXUXevWNMiW_4xizR-3wFw-1; Tue, 20 Oct 2020 17:10:08 -0400
X-MC-Unique: cXUXevWNMiW_4xizR-3wFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC19108E1A2;
	Tue, 20 Oct 2020 21:10:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9C96EF6A;
	Tue, 20 Oct 2020 21:10:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 411758C7C5;
	Tue, 20 Oct 2020 21:10:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KLA1pn005658 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 17:10:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCE5E55784; Tue, 20 Oct 2020 21:10:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6ECD6266E;
	Tue, 20 Oct 2020 21:09:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 17:09:54 -0400
Message-Id: <20201020210957.1009638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/3] fs: dlm: node address
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Alexander Aring (3):
  fs: dlm: cleanup dlm_local_addr properly
  fs: dlm: constify addr_compare
  fs: dlm: check on existing node address

 fs/dlm/lowcomms.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.26.2

