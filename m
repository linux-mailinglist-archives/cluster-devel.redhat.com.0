Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1425AA552
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 03:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662083487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AHoA94Hk0V1+0HXqlkIbJPhRwQPwm6frNDZtWCI6wa4=;
	b=ZYdUXafk8vMHbgnYd8x+r5RyNuAnLi/rg0u8cvT0SrqI9SRPSZHrAWbBjPs9CpTCnXCtVl
	VuCbHkRV0NrAKxXczy5DSXHmK+NafEipT6HkU7hvY7hZPy82gncbKCGzECMvpz2ncPxgym
	KGu/kZbLpNc/ibEaKuYIoHLJceDHVJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-Rm6g2g0jPAW8FELeYUEzkw-1; Thu, 01 Sep 2022 21:51:24 -0400
X-MC-Unique: Rm6g2g0jPAW8FELeYUEzkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3251C85A585;
	Fri,  2 Sep 2022 01:51:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64C9D2166B26;
	Fri,  2 Sep 2022 01:51:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CDC0194B941;
	Fri,  2 Sep 2022 01:51:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC8A31946A44 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  2 Sep 2022 01:51:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CB1F1410F3C; Fri,  2 Sep 2022 01:51:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 794021410F37
 for <cluster-devel@redhat.com>; Fri,  2 Sep 2022 01:51:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6276D185A7BA
 for <cluster-devel@redhat.com>; Fri,  2 Sep 2022 01:51:19 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-618-1Nn90iMCM-GbTRZ4KpwfvA-1; Thu,
 01 Sep 2022 21:51:15 -0400
X-MC-Unique: 1Nn90iMCM-GbTRZ4KpwfvA-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat
 Linux)) id 1oTvpr-00BBC1-SY; Fri, 02 Sep 2022 01:51:07 +0000
Date: Fri, 2 Sep 2022 02:51:07 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <YxFhi1iJ2cFfKi04@ZenIV>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-14-yi.zhang@huawei.com>
 <YxFOqimAyJNxuPM9@ZenIV>
 <3fdab5fd-1efa-9668-da5c-889e9bfa1524@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3fdab5fd-1efa-9668-da5c-889e9bfa1524@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v2 13/14] ext2: replace bh_submit_read()
 helper with bh_read_locked()
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
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com,
 ntfs3@lists.linux.dev, jack@suse.cz, chengzhihao1@huawei.com, mark@fasheh.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 cluster-devel@redhat.com, yukuai3@huawei.com, linux-fsdevel@vger.kernel.org,
 tytso@mit.edu, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 dushistov@mail.ru, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 02, 2022 at 09:32:53AM +0800, Zhang Yi wrote:
> On 2022/9/2 8:30, Al Viro wrote:
> > On Thu, Sep 01, 2022 at 09:35:04PM +0800, Zhang Yi wrote:
> >> bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
> >> has been integrated in bh_read() helper, so switch to use it directly.
> > 
> > s/bh_read_locked/bh_read/ in the summary?
> > 
> 
> Sorry, I don't get your question, I have already replace bh_read_locked()
> with bh_read() in the commit message, there is no bh_read_locked in the whole
> patch. Am I missing something?

Take a look at the subject ;-)

