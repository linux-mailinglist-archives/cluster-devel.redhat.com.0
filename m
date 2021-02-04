Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A49A130FF96
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Feb 2021 22:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612475479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EbnYc1FzvAbUhb3etOXRguIVqWfl0CecxM9HgbZQNvI=;
	b=cp4tOXL+XhvbPZymRa73RoPuTW9rlxtv0An3VZ9AlhGGRisvaX0E8nytyvxKW9wBgfp41M
	ydMVQ/zfU36ngmuiFtzLWQXvSA7UwkRo5ekSMKIxcDDUawoYgU/MatSbCwb4X8EgPV9LkV
	PE1hJxEOkPs4KdTLkJTW44ko5HwzDxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-XdntaAm1NGOrf2Mj8jAkNg-1; Thu, 04 Feb 2021 16:51:18 -0500
X-MC-Unique: XdntaAm1NGOrf2Mj8jAkNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C25192D793;
	Thu,  4 Feb 2021 21:51:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04C9860BE2;
	Thu,  4 Feb 2021 21:51:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21DD14E58E;
	Thu,  4 Feb 2021 21:51:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114Lp6Xv027493 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 16:51:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA0EF60CCF; Thu,  4 Feb 2021 21:51:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-190.rdu2.redhat.com [10.10.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDB5660C9B;
	Thu,  4 Feb 2021 21:51:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  4 Feb 2021 16:50:47 -0500
Message-Id: <20210204215056.774409-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/9] fs: dlm: lowcomms and midcomms
	changes
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

Hi,

this patch series contains some of the patches of the previous patch series
to fix dlm message drops if reconnects occurs. These patches have
less to do something to introduce the reliable midcomms layer so I split
it off the patch series to have them at first upstream which makes the
new feature easier to review.

However I did some changes:

- fix "fs: dlm: remove unaligned memory access handling" to use the
  correct pointer.
- add WARN_ON(1) in "fs: dlm: change allocation limits" to see where an
  illegal allocation size was coming from.
- add patch "fs: dlm: check on dlm header size" from changes of 
  "fs: dlm: remove unaligned memory access handling"

- Alex

Alexander Aring (9):
  fs: dlm: set connected bit after accept
  fs: dlm: set subclass for othercon sock_mutex
  fs: dlm: add errno handling to check callback
  fs: dlm: add check if dlm is currently running
  fs: dlm: change allocation limits
  fs: dlm: use GFP_ZERO for page buffer
  fs: dlm: simplify writequeue handling
  fs: dlm: check on dlm header size
  fs: dlm: remove unaligned memory access handling

 fs/dlm/config.c   | 57 +++++++++++++++++++++++-----
 fs/dlm/lock.c     |  2 -
 fs/dlm/lowcomms.c | 97 +++++++++++++++++++++++++----------------------
 fs/dlm/lowcomms.h |  3 ++
 fs/dlm/midcomms.c | 35 +++++++++--------
 fs/dlm/rcom.c     |  2 -
 6 files changed, 120 insertions(+), 76 deletions(-)

-- 
2.26.2

