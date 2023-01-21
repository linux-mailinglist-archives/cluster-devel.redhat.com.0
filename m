Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E966D6766B5
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 15:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674311311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1AdXcQJG1XWVRa2csTvjE1zXSCuzDdrHU3NdMMnXHYA=;
	b=UWWQ0ogSSQ73CLMvm+bBxnrYR8eWTHH2AWfSzIK9qhNoMZOftxFybP916kpMZGx0ip4u+0
	1vddTZnLKJQHnpiJaJac9kpwHvgd33Aj7qasJHQh7J1F8+KWNtmRWs0sEgNTP3DI0OSoFr
	xXEMYzs9aQPaqFr77TCfbsUxn7Q8ZNs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-R3NxFN9tMEKgnP6GPWmEBg-1; Sat, 21 Jan 2023 09:28:27 -0500
X-MC-Unique: R3NxFN9tMEKgnP6GPWmEBg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0036D2A59557;
	Sat, 21 Jan 2023 14:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27481492B02;
	Sat, 21 Jan 2023 14:28:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D4EDB1946594;
	Sat, 21 Jan 2023 14:28:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4DB161946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 14:28:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D72B640C2005; Sat, 21 Jan 2023 14:28:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA3C40C2004
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 14:28:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE1685A588
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 14:28:23 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-FNtGXeZvP4WYNut9mQuVwg-1; Sat, 21 Jan 2023 09:28:20 -0500
X-MC-Unique: FNtGXeZvP4WYNut9mQuVwg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 70C3668CFE; Sat, 21 Jan 2023 15:28:16 +0100 (CET)
Date: Sat, 21 Jan 2023 15:28:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Message-ID: <20230121142815.GA6786@lst.de>
References: <20230121065755.1140136-8-hch@lst.de>
 <202301211944.5T9l1RgA-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202301211944.5T9l1RgA-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 llvm@lists.linux.dev, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 21, 2023 at 07:52:54PM +0800, kernel test robot wrote:
> Hi Christoph,
> 
> I love your patch! Perhaps something to improve:

And I don't love all this hugging when something doesn't work.  It feels
passive aggressive.

That being said, in this case the error is becaue the series is against
linux-next, so applying it to mainline won't work.

