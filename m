Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6C5A3FB6CC
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 15:16:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-u8ZOGv3MOAa9igL0cfeWgQ-1; Mon, 30 Aug 2021 09:15:57 -0400
X-MC-Unique: u8ZOGv3MOAa9igL0cfeWgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBF441008069;
	Mon, 30 Aug 2021 13:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA92F27C5B;
	Mon, 30 Aug 2021 13:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCF5C4A7CA;
	Mon, 30 Aug 2021 13:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17S2LIN3018205 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 22:21:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C962203663D; Sat, 28 Aug 2021 02:21:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 777202036617
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 02:21:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A81800963
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 02:21:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-9-KmtWoh8MOZ2pGariE67lew-1;
	Fri, 27 Aug 2021 22:21:11 -0400
X-MC-Unique: KmtWoh8MOZ2pGariE67lew-1
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="217775965"
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="217775965"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Aug 2021 19:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="528533365"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2021 19:20:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
	fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2242.10; Fri, 27 Aug 2021 19:20:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
	fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2242.10; Fri, 27 Aug 2021 19:20:06 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
	fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id
	15.01.2242.010; Fri, 27 Aug 2021 19:20:06 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Thread-Topic: [PATCH v7 05/19] iov_iter: Introduce fault_in_iov_iter_writeable
Thread-Index: AQHXm5pzAH4qSaa/BkWiD/swcmZu0auILsxw
Date: Sat, 28 Aug 2021 02:20:05 +0000
Message-ID: <ace2140100e6409a876984fafbb9cbde@intel.com>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
In-Reply-To: <20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17S2LIN3018205
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:15:50 -0400
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [PATCH v7 05/19] iov_iter: Introduce
	fault_in_iov_iter_writeable
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

> But if your kernel code loops and tries again without a return to user,
> then your get another #MC.

I've been trying to push this patch:

https://lore.kernel.org/linux-edac/20210818002942.1607544-1-tony.luck@intel.com/

which turns the infinite loops of machine checks into a panic.

-Tony


