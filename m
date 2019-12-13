Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6D811E27D
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 12:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576234976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9qqWyfaeawh8z5ORKm6FwgSb+U0tnsEmAR1Ovxj86EM=;
	b=iY8qt3AIQhBU5BJxeWKMaCcKT3SZK1wuB5ocmRu6f8tbfSq/cpNp4GdBD/VBqT61Do53tg
	EoKFPxFlLTl3w9Bh52lSVU0xPVvCABMVefVJHdr3WobhTRuszE4+blN25sn2VSo5qyhH8f
	aWKLSU1fvRJUjbHf6L+y/4F5bdSlVmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-_L8UoKCoPReR6PkBDbNMxg-1; Fri, 13 Dec 2019 06:02:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F05F8800D48;
	Fri, 13 Dec 2019 11:02:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2FB45C3FD;
	Fri, 13 Dec 2019 11:02:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A21065D21;
	Fri, 13 Dec 2019 11:02:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDB2cUs020234 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 06:02:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 563EC2166B2A; Fri, 13 Dec 2019 11:02:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5202A2166B27
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 11:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A43010163F3
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 11:02:36 +0000 (UTC)
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-7c-YRT8hNBSX3TEDihlG3g-1; Fri, 13 Dec 2019 06:02:35 -0500
IronPort-SDR: iTJ9AlP92pdTVSpHMppsg7V/YhdfiWCxZIBbv/1dqAfCMyiMbNEKgvVTUxel34qwmaw2vcH2Kc
	DNpO0oV50ts+K/Lziby3Odtk9i2FQ2ePGNmtHNBZW3Z/xwlT4V+0V5jMihVOnBFs5fwgsRwXOm
	Ny3VqCcr3I2bbh4kV6zZV4Kg1sVHxe3PawGjZYZE0UNCX0s1mefNXqMli5JWIWJObRpDD3V7Ub
	74KVKHO0sGH3usX17Iy+ojMxpGcdXUljTw/n1GuyThqqnnNvTyHq68R9cuwipG0TPHKG90ItEL
	BAA=
X-SBRS: 2.7
X-MesageID: 9630801
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9630801"
To: cluster-devel <cluster-devel@redhat.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <fb4c9a28-f1ac-3189-cfe0-e848b2ff8e56@citrix.com>
Date: Fri, 13 Dec 2019 11:02:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: 7c-YRT8hNBSX3TEDihlG3g-1
X-MC-Unique: _L8UoKCoPReR6PkBDbNMxg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Mark Syms <Mark.Syms@citrix.com>
Subject: [Cluster-devel] Follow up to "kernel BUG at fs/gfs2/inode.h:64"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reviving the thread "kernel BUG at fs/gfs2/inode.h:64" from January [1]...

We finally hit the assertion in gfs2_add_inode_blocks() after it has
been fixed. Debug logging showed that in sweep_bh_for_rgrps():

blen = 1
isize_blks = 0

which is then used as follows:

__gfs2_free_blocks(ip, bstart, (u32)blen, meta);
(*btotal) += blen;
gfs2_add_inode_blocks(&ip->i_inode, -blen);

This confirms Tim's suspicion that i_blocks is already 0 at the
point we're trying to free a block.

Any ideas on how this situation may have occurred? The test case
power-cycles hosts so perhaps this is some form of corruption that
would be fixed by Bob's recovery patch series?

[1] https://www.redhat.com/archives/cluster-devel/2019-January/msg00007.html

Thanks,
-- 
Ross Lagerwall

