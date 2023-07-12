Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C5750F4A
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jul 2023 19:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689181661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=689SEK0ciFY8KgDlRHFBreHHAC2z+cvH0wQ011Q2aMI=;
	b=gqsbaWts6HFVKNz+ONL1n1GqS1xtGMDEQVtvnjKq7D7TaiF6Z/KGmK5NE440Qu5H19UO3L
	1/KhUmp4/LfCIVxdhkcDDkuHl6abdk72Lqn9cBwrZzL/Gcyu1I0enjGDepYw8pHt36ewbx
	RsSER6lmqe179U4UYb8MlZJ410TMU94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-5WY0XQs_OnepG7mMFtduxQ-1; Wed, 12 Jul 2023 13:07:37 -0400
X-MC-Unique: 5WY0XQs_OnepG7mMFtduxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26687104458E;
	Wed, 12 Jul 2023 17:07:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEAC4492C13;
	Wed, 12 Jul 2023 17:07:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 69FA719465A0;
	Wed, 12 Jul 2023 17:07:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C006C194658F for <cluster-devel@listman.corp.redhat.com>;
 Wed, 12 Jul 2023 16:55:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4551B492B02; Wed, 12 Jul 2023 16:55:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1A7492B01
 for <cluster-devel@redhat.com>; Wed, 12 Jul 2023 16:55:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2264388D587
 for <cluster-devel@redhat.com>; Wed, 12 Jul 2023 16:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-eXkJDWMlM6-qZgxqJUleMA-1; Wed, 12 Jul 2023 12:55:40 -0400
X-MC-Unique: eXkJDWMlM6-qZgxqJUleMA-1
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJboy-000MRl-20; Wed, 12 Jul 2023 15:32:04 +0000
Message-ID: <03e153ce-328b-f279-2a40-4074bea2bc8f@infradead.org>
Date: Wed, 12 Jul 2023 08:31:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230621144507.55591-2-jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Wed, 12 Jul 2023 17:07:23 +0000
Subject: Re: [Cluster-devel] [PATCH 01/79] fs: add ctime accessors
 infrastructure
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jeff,

On arch/um/, (subarch i386 or x86_64), hostfs build fails with:

../fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for arg
ument 2 of 'inode_set_ctime_to_ts'
../include/linux/fs.h:1499:73: note: expected 'struct timespec64' b
ut argument is of type 'const struct hostfs_timespec *'


-- 
~Randy

