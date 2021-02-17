Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 96C8931D31F
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520144;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S2Er5O35Ix/laLcDkghVSfq/JeV2VB4ohgIda4f6mFI=;
	b=I6PaIvvq2CSZOFnf7kKuzwl9hdWsw2hrV27oUd9tbelgQw+5XfPIFBR5VfyVQd3a2+r7De
	zjGOAzkb6ZA92L8CSexgnk362U+LXYRvMleamPgyk/n7nsdiQyC6C5xoJxsOrb6K46tSOe
	SWX0MKU9g2c2ow/wI7AUWGhxw7c6vhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368--NXl18k4Pi6WBY3qU-6l1Q-1; Tue, 16 Feb 2021 19:02:21 -0500
X-MC-Unique: -NXl18k4Pi6WBY3qU-6l1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF4BA1935780;
	Wed, 17 Feb 2021 00:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA7A510021AA;
	Wed, 17 Feb 2021 00:02:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB39F57DFA;
	Wed, 17 Feb 2021 00:02:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00q6N031245 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D68605C6C1; Wed, 17 Feb 2021 00:00:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 540255C1B4;
	Wed, 17 Feb 2021 00:00:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:34 -0500
Message-Id: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 00/12] fs: dlm: lowcomms and
	midcomms changes
X-BeenThere: cluster-devel@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@listman.redhat.com>
List-Help: <mailto:cluster-devel-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@listman.redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@listman.redhat.com
Errors-To: cluster-devel-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

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

changes since v2:
 - fix length check in dlm processing loop=20
 - add "fs: dlm: fix debugfs dump" patch
 - add "fs: dlm: flush swork on shutdown" patch
 - add "fs: dlm: add shutdown hook"

About the shutdown hook:

The lowcomms layer will synchronize workqueue at "stop" hook and we
already released the lockspace. I introduce the shutdown callback
to synchronize the workqueue/tcp before releasing the lockspace
but after stopping the recoverd thread. I hope at this point we
don't transmit anymore (calling dlm_lowcomms_commit_buffer()) from
dlm application layer and we are still capable to deliver dlm messages
from lowcomms to application. However the current code definitely has
some issues there which I expirence with tcpkill and reliable
connection patches. I need to recheck if DLM_FIN is really necessary.

Alexander Aring (12):
  fs: dlm: fix debugfs dump
  fs: dlm: set connected bit after accept
  fs: dlm: set subclass for othercon sock_mutex
  fs: dlm: add errno handling to check callback
  fs: dlm: add check if dlm is currently running
  fs: dlm: change allocation limits
  fs: dlm: use GFP_ZERO for page buffer
  fs: dlm: simplify writequeue handling
  fs: dlm: check on minimum msglen size
  fs: dlm: remove unaligned memory access handling
  fs: dlm: flush swork on shutdown
  fs: dlm: add shutdown hook

 fs/dlm/config.c    |  57 +++++++++++++++---
 fs/dlm/debug_fs.c  |   1 +
 fs/dlm/lock.c      |   2 -
 fs/dlm/lockspace.c |   3 +
 fs/dlm/lowcomms.c  | 144 ++++++++++++++++++++++++---------------------
 fs/dlm/lowcomms.h  |   4 ++
 fs/dlm/midcomms.c  |  33 +++++------
 fs/dlm/rcom.c      |   2 -
 8 files changed, 148 insertions(+), 98 deletions(-)

--=20
2.26.2

