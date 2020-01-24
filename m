Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BB427147887
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jan 2020 07:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579847086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8gKPNyr5Mub9VjxBKaspnhr+GC8n+Llcnykn3nCuFF4=;
	b=Fif6GrdtgctTEs10KEpmll2vEcP+tOAnkIKOZqfJpPRa7R8kPO8uMTihFe+s4FvEQ54Rsd
	pAAIuXGMEmYZC6/vNtx1pnMwEn8OX29P9eP7J9Tgc/VNL5aksaOCXupuPGYipSRchUvvPD
	0OGXTIDPP6+HWIXqdSs+UgAvOzwIRB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-tsqpLXEcN2KhVC3gfOfnWw-1; Fri, 24 Jan 2020 01:24:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C14518543A2;
	Fri, 24 Jan 2020 06:24:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B743A4;
	Fri, 24 Jan 2020 06:24:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 802FC1809567;
	Fri, 24 Jan 2020 06:24:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00O6OXUR008216 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 01:24:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 233631055530; Fri, 24 Jan 2020 06:24:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F056105552F
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 06:24:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 670EE1011E35
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 06:24:31 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-288-WhaU2P9JOTmr2jAD27BOFg-1;
	Fri, 24 Jan 2020 01:24:25 -0500
Received: from vvs-ws.sw.ru ([172.16.24.21])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vvs@virtuozzo.com>)
	id 1ius3b-0007mB-NA; Fri, 24 Jan 2020 09:03:03 +0300
From: Vasily Averin <vvs@virtuozzo.com>
To: cluster-devel@redhat.com
Message-ID: <e29a1e94-1c12-5b12-7c5b-605a46b7a1c1@virtuozzo.com>
Date: Fri, 24 Jan 2020 09:03:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: WhaU2P9JOTmr2jAD27BOFg-1
X-MC-Unique: tsqpLXEcN2KhVC3gfOfnWw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00O6OXUR008216
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/1] dlm: seq_file .next functions should
 increase position index
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In Aug 2018 NeilBrown noticed=20
commit 1f4aace60b0e ("fs/seq_file.c: simplify seq_file iteration code and i=
nterface")
"Some ->next functions do not increment *pos when they return NULL...
Note that such ->next functions are buggy and should be fixed.=20
A simple demonstration is
  =20
dd if=3D/proc/swaps bs=3D1000 skip=3D1
   =20
Choose any block size larger than the size of /proc/swaps.  This will
always show the whole last line of /proc/swaps"

Described problem is still actual. If you make lseek into middle of last ou=
tput line=20
following read will output end of last line and whole last line once again.

$ dd if=3D/proc/swaps bs=3D1  # usual output
Filename=09=09=09=09Type=09=09Size=09Used=09Priority
/dev/dm-0                               partition=094194812=0997536=09-2
104+0 records in
104+0 records out
104 bytes copied

$ dd if=3D/proc/swaps bs=3D40 skip=3D1    # last line was generated twice
dd: /proc/swaps: cannot skip to specified offset
v/dm-0                               partition=094194812=0997536=09-2
/dev/dm-0                               partition=094194812=0997536=09-2=20
3+1 records in
3+1 records out
131 bytes copied

There are lot of other affected files, I've found 30+ including
/proc/net/ip_tables_matches and /proc/sysvipc/*

Following patch fixes the problem in dlm-related file

https://bugzilla.kernel.org/show_bug.cgi?id=3D206283

Vasily Averin (1):
  table_seq_next should increase position index

 fs/dlm/debug_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
1.8.3.1


