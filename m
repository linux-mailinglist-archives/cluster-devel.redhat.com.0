Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF4391CB
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Jun 2019 18:22:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC43F30872C4;
	Fri,  7 Jun 2019 16:22:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6970F60E39;
	Fri,  7 Jun 2019 16:22:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E55C1806B15;
	Fri,  7 Jun 2019 16:22:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57GLwYw012665 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 12:21:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44B187FEAB; Fri,  7 Jun 2019 16:21:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DCAB80883;
	Fri,  7 Jun 2019 16:21:52 +0000 (UTC)
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5282A3066800;
	Fri,  7 Jun 2019 16:21:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
	dkim=none (message not signed) header.i=none;
	spf=None smtp.pra=ross.lagerwall@citrix.com;
	spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
	spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	ross.lagerwall@citrix.com) identity=pra;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="ross.lagerwall@citrix.com";
	x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
	ross.lagerwall@citrix.com designates 162.221.158.21 as
	permitted sender) identity=mailfrom;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="ross.lagerwall@citrix.com";
	x-conformance=sidf_compatible; x-record-type="v=spf1";
	x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
	ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
	ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
	ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@mail.citrix.com) identity=helo;
	client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="postmaster@mail.citrix.com";
	x-conformance=sidf_compatible
IronPort-SDR: 2eFvql2en0umVBHwtVlo1bfdK2kaLM1PyJSCIlTmiskzOTIPQGGBdt2UzE6+2YTYvwygt543lo
	aKW5grvHHVYssWZsAwFkU3ui6l0hUaQbpowxnX7ttD1HDuc4f2IVHkiSJvDtiejI8Io8H/HcTl
	Jkbdoz9/Gxe10rAvAqAdjL3xwOht2CNFPeXfigaz+HZhve00+008tLhwUeRkgOk1mODosX9+Hq
	an1qKRw33y15PnrwzTrrb2HuFC/1fXTkVbGgXY9r4JXEO4Mg4jj3MNvXwK8HsHzA0m2kEy8HQD
	e3E=
X-SBRS: -0.9
X-MesageID: 1465375
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,563,1557201600"; 
   d="scan'208";a="1465375"
To: Andreas Gruenbacher <agruenba@redhat.com>, <cluster-devel@redhat.com>
References: <20190507203204.26008-1-agruenba@redhat.com>
	<20190507203204.26008-11-agruenba@redhat.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <5c5d673b-57dd-7720-4420-badac31b76c3@citrix.com>
Date: Fri, 7 Jun 2019 17:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190507203204.26008-11-agruenba@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 07 Jun 2019 16:21:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 07 Jun 2019 16:21:35 +0000 (UTC) for IP:'216.71.145.155'
	DOMAIN:'esa3.hc3370-68.iphmx.com' HELO:'esa3.hc3370-68.iphmx.com'
	FROM:'ross.lagerwall@citrix.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 216.71.145.155 esa3.hc3370-68.iphmx.com
	216.71.145.155 esa3.hc3370-68.iphmx.com
	<ross.lagerwall@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 11/12] gfs2: Fix iomap write page
 reclaim deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 07 Jun 2019 16:22:56 +0000 (UTC)

On 5/7/19 9:32 PM, Andreas Gruenbacher wrote:
> Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
> buffered writes by starting a transaction in iomap_begin, writing a range of
> pages, and ending that transaction in iomap_end.  This approach suffers from
> two problems:
> 
>    (1) Any allocations necessary for the write are done in iomap_begin, so when
>    the data aren't journaled, there is no need for keeping the transaction open
>    until iomap_end.
> 
>    (2) Transactions keep the gfs2 log flush lock held.  When
>    iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
>    gfs2_write_inode, which will try to flush the log.  This requires taking the
>    log flush lock which is already held, resulting in a deadlock.
> 
> Fix both of these issues by not keeping transactions open from iomap_begin to
> iomap_end.  Instead, start a small transaction in page_prepare and end it in
> page_done when necessary.
> 
Unfortunately, this patch broke growing gfs2 filesystems. It is easy to 
reproduce:

$ mkfs.gfs2 -t xxx:yyy /dev/xvdb  4369065
$ mount /dev/xvdb /mnt
$ gfs2_grow /mnt (doesn't finish)
FS: Mount point:             /mnt
FS: Device:                  /dev/xvdb
FS: Size:                    4369062 (0x42aaa6)
DEV: Length:                 13107200 (0xc80000)
The file system will grow by 34133MB.

Looking at the kernel log, I see it hits the following assertion and 
then hangs trying to withdraw the filesystem (which is a separate 
problem, presumably):

gfs2: fsid=xxx:yyy.0: fatal: assertion "(nbuf <= tr->tr_blocks) && 
(tr->tr_num_revoke <= tr->tr_revokes)" failed
    function = gfs2_trans_end, file = fs/gfs2/trans.c, line = 117
gfs2: fsid=xxx:yyy.0: about to withdraw this file system

Rearranging the code so that it prints information about the transaction 
before the failed withdrawal attempt shows:
gfs2: fsid=xxx:yyy.0: Transaction created at: 
iomap_write_begin.constprop.45+0xbc/0x380
gfs2: fsid=xxx:yyy.0: blocks=1 revokes=0 reserved=8 touched=1
gfs2: fsid=xxx:yyy.0: Buf 1/0 Databuf 1/0 Revoke 0/0

Reverting this commit fixes the issue. Tested with git master as of 
today (16d72dd4891fe).

Thanks,
-- 
Ross Lagerwall

