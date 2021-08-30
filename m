Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED703FB923
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 17:42:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-YM1lem8uN9iaMUfPLYdI8w-1; Mon, 30 Aug 2021 11:42:06 -0400
X-MC-Unique: YM1lem8uN9iaMUfPLYdI8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F8C71B18BC1;
	Mon, 30 Aug 2021 15:42:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517825C1D5;
	Mon, 30 Aug 2021 15:42:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E0A3181A0F8;
	Mon, 30 Aug 2021 15:42:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17UFfuL8010427 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 11:41:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9407563F5E; Mon, 30 Aug 2021 15:41:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD2D63F5B
	for <cluster-devel@redhat.com>; Mon, 30 Aug 2021 15:41:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A99A4100B8C8
	for <cluster-devel@redhat.com>; Mon, 30 Aug 2021 15:41:53 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-312-CPwbnj2NPkaPgA0fMssd7w-1;
	Mon, 30 Aug 2021 11:41:51 -0400
X-MC-Unique: CPwbnj2NPkaPgA0fMssd7w-1
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="216448415"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="216448415"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Aug 2021 08:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="427871610"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2021 08:41:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
	fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2242.10; Mon, 30 Aug 2021 08:41:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
	fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2242.10; Mon, 30 Aug 2021 08:41:45 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
	fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id
	15.01.2242.010; Mon, 30 Aug 2021 08:41:45 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Thread-Topic: [PATCH v7 05/19] iov_iter: Introduce fault_in_iov_iter_writeable
Thread-Index: AQHXm5pzAH4qSaa/BkWiD/swcmZu0auJ6p2AgAAE7YCAAAHvAP//xYSWgAJ7rdA=
Date: Mon, 30 Aug 2021 15:41:45 +0000
Message-ID: <65cdd5f19431423dac13fbb13719ba55@intel.com>
References: <YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
	<87r1edgs2w.ffs@tglx> <YSqy+U/3lnF6K0ia@zeniv-ca.linux.org.uk>
	<YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
	<CA+8MBbLLze0siip=h-2hR3XiceBFQCN7uh5BPvqYRyBXgT318g@mail.gmail.com>
	<YSrlq41Ytw7q8fCR@casper.infradead.org>
In-Reply-To: <YSrlq41Ytw7q8fCR@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17UFfuL8010427
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, X86-ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

>> No #MC on stores. Just on loads. Note that you can't clear poison
>> state with a series of small writes to the cache line. But a single
>> 64-byte store might do it (architects didn't want to guarantee that
>> it would work when I asked about avx512 stores to clear poison
>> many years ago).
>
> Dave Jiang thinks MOVDIR64B clears poison.
>
> http://archive.lwn.net:8080/linux-kernel/157617505636.42350.1170110675242558018.stgit@djiang5-desk3.ch.intel.com/

MOVDIR64B has some explicit guarantees (does a write-back invalidate if the target is already
in the cache) that a 64-byte avx512 write doesn't.

Of course it would stop working if some future CPU were to have a longer than 64 bytes cache line.

-Tony


