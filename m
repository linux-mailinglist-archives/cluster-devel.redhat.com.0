Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 382646780E1
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Jan 2023 17:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674489966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EXK4HWxguanCnWaNmAc/k1AK4Y+TRvhBmSc5HlQjr1M=;
	b=W4pf9UCW40T+b01GZN8xHnMBEZSJoo1Q9ITVhha35/mGPGMIBwvcTBLNGBhbpNXa/E5Yh/
	2c3coXjelCZ/Frq6SP3FkDa0lVOQmLVKKFv76Lge/RroM8ee8VEtPZwzhcxn3/5T14qt4C
	FNA4PlrYInnx2fE3oQweFeiQd7lum2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-FzAioeLqPDys69NSYGQ9Iw-1; Mon, 23 Jan 2023 11:05:56 -0500
X-MC-Unique: FzAioeLqPDys69NSYGQ9Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF79800B30;
	Mon, 23 Jan 2023 16:05:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37DA2C15BAD;
	Mon, 23 Jan 2023 16:05:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E56D01946595;
	Mon, 23 Jan 2023 16:05:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 33F2C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 23 Jan 2023 16:05:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F7F8492B01; Mon, 23 Jan 2023 16:05:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18B67492C3F
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 16:05:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1A46885621
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 16:05:38 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-orx1sfGTOp-_2JNo0yqv7A-1; Mon, 23 Jan 2023 11:05:37 -0500
X-MC-Unique: orx1sfGTOp-_2JNo0yqv7A-1
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 30NG37qq020715
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 11:03:08 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 6F63415C469B; Mon, 23 Jan 2023 11:03:07 -0500 (EST)
Date: Mon, 23 Jan 2023 11:03:07 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Message-ID: <Y86vu2WSGWCHpdJL@mit.edu>
References: <20230122090115.1563753-1-agruenba@redhat.com>
 <CAHk-=wgjMNbNG0FMatHtmzEZPj0ZmQpNRsnRvH47igJoC9TBww@mail.gmail.com>
 <20230123100556.qxdjdmcms5ven52v@quack3>
MIME-Version: 1.0
In-Reply-To: <20230123100556.qxdjdmcms5ven52v@quack3>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 writepage fix
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Steve French <smfrench@gmail.com>, Trond Myklebust <trondmy@hammerspace.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 23, 2023 at 11:05:56AM +0100, Jan Kara wrote:
> Thanks for the heads up. So we had kind of a similar issue for ext4 but it
> got caught by Ted during his regression runs so we've basically done what
> GFS2 is doing for the merge window and now there's patchset pending to
> convert the data=journal path as well because as Andreas states in his
> changelog of the revert that's a bit more tricky. But at least for ext4
> the conversion of data=journal path resulted in much cleaner and shorter
> code.

https://thunk.org/tytso/images/firestarter-fs-development-without-testing.jpg

:-)

							- Ted

