Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB0672C43
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:21:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AD953092657;
	Wed, 24 Jul 2019 10:21:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F51C60BCE;
	Wed, 24 Jul 2019 10:21:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC06F41F53;
	Wed, 24 Jul 2019 10:21:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OALiCq015452 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:21:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B5C260497; Wed, 24 Jul 2019 10:21:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44C91601B7;
	Wed, 24 Jul 2019 10:21:42 +0000 (UTC)
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
	[216.71.145.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AEAF308429D;
	Wed, 24 Jul 2019 10:21:32 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
	dkim=none (message not signed) header.i=none;
	spf=None smtp.pra=edvin.torok@citrix.com;
	spf=Pass smtp.mailfrom=edvin.torok@citrix.com;
	spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	edvin.torok@citrix.com) identity=pra;
	client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="edvin.torok@citrix.com";
	x-sender="edvin.torok@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
	edvin.torok@citrix.com designates 162.221.158.21 as permitted
	sender) identity=mailfrom; client-ip=162.221.158.21;
	receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="edvin.torok@citrix.com";
	x-sender="edvin.torok@citrix.com";
	x-conformance=sidf_compatible; x-record-type="v=spf1";
	x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
	ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
	ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
	ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@mail.citrix.com) identity=helo;
	client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
	envelope-from="edvin.torok@citrix.com";
	x-sender="postmaster@mail.citrix.com";
	x-conformance=sidf_compatible
IronPort-SDR: +PY0QWQUyP3X0kJMu9HL+yxukASQ/pBquQCvN4QF7h6Xr98Wv6Ud+8Pw1GJV/WPOAkVgoegfF9
	8hrIxf+YyKo7YYaC7tS+VUqJHYhtZvi9od/xog0y5Jax//SG3+QhG7bSnHoEyRwJlFvAU6yDbd
	u6s+/Pu1an3vFkM62Yua0/5ZOYNoMGAxDjCAZL7NdhbM2H+5ty9oHCwMQGN5XLezJTmDz66hQw
	GL09mlT9n6HCnIVa6Bllg6BxMPMkx+f52mZ6WdNOhUu94u9mQqfpRjpgl8rqKgu4922dt72v76
	l2A=
X-SBRS: 2.7
X-MesageID: 3396266
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,302,1559534400"; 
   d="scan'208";a="3396266"
To: Christoph Hellwig <hch@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
	<20190724100207.GA7916@infradead.org>
From: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Openpgp: preference=signencrypt
Message-ID: <164d20c3-2854-37d4-1a67-05dd3d61a905@citrix.com>
Date: Wed, 24 Jul 2019 11:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190724100207.GA7916@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 24 Jul 2019 10:21:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 24 Jul 2019 10:21:33 +0000 (UTC) for IP:'216.71.145.142'
	DOMAIN:'esa1.hc3370-68.iphmx.com'
	HELO:'esa1.hc3370-68.iphmx.com' FROM:'edvin.torok@citrix.com'
	RCPT:''
X-RedHat-Spam-Score: -2.299  (FROM_EXCESS_BASE64, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,
	SPF_PASS) 216.71.145.142 esa1.hc3370-68.iphmx.com 216.71.145.142
	esa1.hc3370-68.iphmx.com <edvin.torok@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, baijiaju1990@gmail.com
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 24 Jul 2019 10:21:49 +0000 (UTC)



On 24/07/2019 11:02, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 09:48:38AM +0100, Steven Whitehouse wrote:
>> Hi,
>>
>> On 24/07/2019 09:43, Jia-Ju Bai wrote:
>>> In gfs2_alloc_inode(), when kmem_cache_alloc() on line 1724 returns
>>> NULL, ip is assigned to NULL. In this case, "return &ip->i_inode" will
>>> cause a null-pointer dereference.
>>>
>>> To fix this null-pointer dereference, NULL is returned when ip is NULL.
>>>
>>> This bug is found by a static analysis tool STCheck written by us.
>>
>> The bug is in the tool I'm afraid. Since i_inode is the first element of ip,
>> there is no NULL dereference here. A pointer to ip->i_inode and a pointer to
>> ip are one and the same (bar the differing types) which is the reason that
>> we return &ip->i_inode rather than just ip,
> 
> But that doesn't help if ip is NULL, as dereferencing a field in in
> still remains invalid behavior.
> 

According to C99 you may be right that it is undefined behaviour, that just happens to work correctly on current versions
of GCC, see [1].
Although as pointed out in [1] this undefined behaviour was relied upon to implement the offsetof macro
(nowadays that should be a compiler built-in, see include/linux/stddef.h).

I wish that cases like these would be more clearly defined in the C standard, at least as implementation defined behavior such that GCC
could then be explicit about what semantics it wants and document it here: https://gcc.gnu.org/onlinedocs/gcc/#toc-C-Implementation-Defined-Behavior
It is difficult to write future-proof code if the compiler can keep changing its mind about semantics of code that it has previously accepted.

[1] https://software.intel.com/en-us/blogs/2015/04/20/null-pointer-dereferencing-causes-undefined-behavior

Best regards,
--Edwin

