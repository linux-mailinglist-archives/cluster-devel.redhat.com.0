Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C643D3C5F7
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jun 2019 10:31:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE20681DE8;
	Tue, 11 Jun 2019 08:31:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24805600CD;
	Tue, 11 Jun 2019 08:31:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 876F41806B0F;
	Tue, 11 Jun 2019 08:31:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5B8UuFj002749 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 04:30:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3B675D705; Tue, 11 Jun 2019 08:30:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 634CF5D6A9;
	Tue, 11 Jun 2019 08:30:54 +0000 (UTC)
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
	[216.71.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1D2919DCB;
	Tue, 11 Jun 2019 08:30:07 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
	dkim=none (message not signed) header.i=none;
	spf=None smtp.pra=ross.lagerwall@citrix.com;
	spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
	spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	ross.lagerwall@citrix.com) identity=pra;
	client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="ross.lagerwall@citrix.com";
	x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
	ross.lagerwall@citrix.com designates 162.221.158.21 as
	permitted sender) identity=mailfrom;
	client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="ross.lagerwall@citrix.com";
	x-conformance=sidf_compatible; x-record-type="v=spf1";
	x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
	ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
	ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
	ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@mail.citrix.com) identity=helo;
	client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
	envelope-from="ross.lagerwall@citrix.com";
	x-sender="postmaster@mail.citrix.com";
	x-conformance=sidf_compatible
IronPort-SDR: v+pM56GcreTLPNq2syBF76e5l76BKpT/lfpDpthcGOZWIVcA/52Lj8OgWLi1WKliGziBIIDHmq
	NtO837aKXcTgK33f8qdM9PCbCV94MxKuf4P0DzrpQDEyCTY5lr0lNpha59aoGmHRTEiRqKybiN
	OcX9c5x+x5/IG8TCAvEsZRdbx4AY4ivVDcppunSjT65rnezpkBgUNWgFSd/Hs4UHQuindJkspo
	gSQo3aC8/Y0YrraxtBCoMUJAdJ2dq5cwZglwZ+k4MmkIFOhAFy4/KvBz6FCbqsI+P6vOzVbs95
	SlU=
X-SBRS: 2.7
X-MesageID: 1544901
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1544901"
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <5c5d673b-57dd-7720-4420-badac31b76c3@citrix.com>
	<20190608121601.4897-1-agruenba@redhat.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <e1a67505-98c2-a194-6df8-a01d341ada79@citrix.com>
Date: Tue, 11 Jun 2019 09:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190608121601.4897-1-agruenba@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 11 Jun 2019 08:30:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 11 Jun 2019 08:30:39 +0000 (UTC) for IP:'216.71.155.168'
	DOMAIN:'esa5.hc3370-68.iphmx.com' HELO:'esa5.hc3370-68.iphmx.com'
	FROM:'ross.lagerwall@citrix.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 216.71.155.168 esa5.hc3370-68.iphmx.com
	216.71.155.168 esa5.hc3370-68.iphmx.com
	<ross.lagerwall@citrix.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 11 Jun 2019 08:31:49 +0000 (UTC)

On 6/8/19 1:16 PM, Andreas Gruenbacher wrote:
> Hi Ross,
> 
> On Fri, 7 Jun 2019 at 18:21, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:
>> On 5/7/19 9:32 PM, Andreas Gruenbacher wrote:
>>> Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
>>> buffered writes by starting a transaction in iomap_begin, writing a range of
>>> pages, and ending that transaction in iomap_end.  This approach suffers from
>>> two problems:
>>>
>>>     (1) Any allocations necessary for the write are done in iomap_begin, so when
>>>     the data aren't journaled, there is no need for keeping the transaction open
>>>     until iomap_end.
>>>
>>>     (2) Transactions keep the gfs2 log flush lock held.  When
>>>     iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
>>>     gfs2_write_inode, which will try to flush the log.  This requires taking the
>>>     log flush lock which is already held, resulting in a deadlock.
>>>
>>> Fix both of these issues by not keeping transactions open from iomap_begin to
>>> iomap_end.  Instead, start a small transaction in page_prepare and end it in
>>> page_done when necessary.
>>>
>> Unfortunately, this patch broke growing gfs2 filesystems. It is easy to
>> reproduce:
>>
>> $ mkfs.gfs2 -t xxx:yyy /dev/xvdb  4369065
>> $ mount /dev/xvdb /mnt
>> $ gfs2_grow /mnt (doesn't finish)
>> FS: Mount point:             /mnt
>> FS: Device:                  /dev/xvdb
>> FS: Size:                    4369062 (0x42aaa6)
>> DEV: Length:                 13107200 (0xc80000)
>> The file system will grow by 34133MB.
>>
>> Looking at the kernel log, I see it hits the following assertion and
>> then hangs trying to withdraw the filesystem (which is a separate
>> problem, presumably):
>>
>> gfs2: fsid=xxx:yyy.0: fatal: assertion "(nbuf <= tr->tr_blocks) &&
>> (tr->tr_num_revoke <= tr->tr_revokes)" failed
>>      function = gfs2_trans_end, file = fs/gfs2/trans.c, line = 117
>> gfs2: fsid=xxx:yyy.0: about to withdraw this file system
>>
>> Rearranging the code so that it prints information about the transaction
>> before the failed withdrawal attempt shows:
>> gfs2: fsid=xxx:yyy.0: Transaction created at:
>> iomap_write_begin.constprop.45+0xbc/0x380
>> gfs2: fsid=xxx:yyy.0: blocks=1 revokes=0 reserved=8 touched=1
>> gfs2: fsid=xxx:yyy.0: Buf 1/0 Databuf 1/0 Revoke 0/0
>>
>> Reverting this commit fixes the issue. Tested with git master as of
>> today (16d72dd4891fe).
> 
> thanks for the error report. This turns out to be a rounding error in
> gfs2_iomap_page_prepare; the attached patch should help.
> 
Yes, that fixes the problem. Thanks for the quick response.

-- 
Ross Lagerwall

