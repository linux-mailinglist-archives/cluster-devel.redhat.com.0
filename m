Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3F44B51FE
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Feb 2022 14:42:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-NFRtfjp7MWSsqttAesL2PQ-1; Mon, 14 Feb 2022 08:42:24 -0500
X-MC-Unique: NFRtfjp7MWSsqttAesL2PQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08C31091DA2;
	Mon, 14 Feb 2022 13:42:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6806B749BD;
	Mon, 14 Feb 2022 13:42:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DBAE180BADA;
	Mon, 14 Feb 2022 13:42:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EDgEVR010337 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 08:42:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AC6B7C5094B; Mon, 14 Feb 2022 13:42:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A89EDC50941
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 13:42:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93B573822202
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 13:42:14 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-299-sNVTH2IfOf6pESCY4_y7rg-1; Mon, 14 Feb 2022 08:42:10 -0500
X-MC-Unique: sNVTH2IfOf6pESCY4_y7rg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 577B368AA6; Mon, 14 Feb 2022 14:42:06 +0100 (CET)
Date: Mon, 14 Feb 2022 14:42:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20220214134206.GA29930@lst.de>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia> <YgTl2Lm9Vk50WNSj@google.com>
	<YgZ0lyr91jw6JaHg@casper.infradead.org>
	<YgowAl01rq5A8Sil@google.com>
MIME-Version: 1.0
In-Reply-To: <YgowAl01rq5A8Sil@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Matthew Wilcox <willy@infradead.org>, Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>,
	syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Let me repeat myself:  Please send a proper bug report to the linux-ext4
list.  Thanks!

