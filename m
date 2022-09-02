Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 448125AA562
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Sep 2022 03:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662083934;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=37b0keShD3KmwOFuotmC78IQ38FfZoKZS2F4v85LOXk=;
	b=R5ofMdRRHz04x+eF2oIo4pirOpGpSGXRglW6zj+Ea8Cmk25D2itmtNhTldSFHwogFNYczK
	mj88I/IgRZldqaoeGlQUXBrS+cBfM257OI888TWVlwfvCi7YVP6mRX0Jhj5jDk87M346hJ
	jF/q+GVIYt+YhHBwoFJ9Sa3qBXZiLnM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-DWHudKlnO8O0IFRNypEukQ-1; Thu, 01 Sep 2022 21:58:50 -0400
X-MC-Unique: DWHudKlnO8O0IFRNypEukQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A67101A54E;
	Fri,  2 Sep 2022 01:58:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7855492C3B;
	Fri,  2 Sep 2022 01:58:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 679B6194B941;
	Fri,  2 Sep 2022 01:58:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF38B1946A44 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  2 Sep 2022 01:58:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B64F2166B2A; Fri,  2 Sep 2022 01:58:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B192166B26
 for <cluster-devel@redhat.com>; Fri,  2 Sep 2022 01:58:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A9343C0E22D
 for <cluster-devel@redhat.com>; Fri,  2 Sep 2022 01:58:47 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com
 [45.249.212.187]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-tiSZKgPcPeeIbEOOj8EnCg-1; Thu, 01 Sep 2022 21:58:42 -0400
X-MC-Unique: tiSZKgPcPeeIbEOOj8EnCg-1
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJgw03pldzkX1X;
 Fri,  2 Sep 2022 09:54:56 +0800 (CST)
Received: from [10.174.178.134] (10.174.178.134) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 09:58:37 +0800
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-14-yi.zhang@huawei.com> <YxFOqimAyJNxuPM9@ZenIV>
 <3fdab5fd-1efa-9668-da5c-889e9bfa1524@huawei.com> <YxFhi1iJ2cFfKi04@ZenIV>
From: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <e1dbafd4-4696-3c3f-ac0d-6fc7d06c9b58@huawei.com>
Date: Fri, 2 Sep 2022 09:58:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YxFhi1iJ2cFfKi04@ZenIV>
X-Originating-IP: [10.174.178.134]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2022/9/2 9:51, Al Viro wrote:
> On Fri, Sep 02, 2022 at 09:32:53AM +0800, Zhang Yi wrote:
>> On 2022/9/2 8:30, Al Viro wrote:
>>> On Thu, Sep 01, 2022 at 09:35:04PM +0800, Zhang Yi wrote:
>>>> bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
>>>> has been integrated in bh_read() helper, so switch to use it directly.
>>>
>>> s/bh_read_locked/bh_read/ in the summary?
>>>
>>
>> Sorry, I don't get your question, I have already replace bh_read_locked()
>> with bh_read() in the commit message, there is no bh_read_locked in the whole
>> patch. Am I missing something?
> 
> Take a look at the subject ;-)

Oh, yes, I forgot to update the subject, will do.

Thanks,
Yi.

