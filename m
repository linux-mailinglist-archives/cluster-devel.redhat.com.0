Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B504B6D79D0
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 12:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680691019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
	b=Ya/vIIyoP3pGRKnL4MGTYK1MgeInlKyAtvGJV1+PDTSc9bIhTmDwbty0p7ug1wP9WZhW+b
	SZe2oGvxMVTcgIyqWlqNbWsq8k61cjmR6ZjwN80CMCmGXVfi0jTl3Tq4N0GoL5EU1RiOE9
	Sv4dP4T7t7UvwKfBl7aDM1JUogMhfcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-LpQgvQNdNe-n-F0m8dq93A-1; Wed, 05 Apr 2023 06:36:54 -0400
X-MC-Unique: LpQgvQNdNe-n-F0m8dq93A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C8D3811E7C;
	Wed,  5 Apr 2023 10:36:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 696DA4020C82;
	Wed,  5 Apr 2023 10:36:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E2AFC1946597;
	Wed,  5 Apr 2023 10:36:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E3A71946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 10:36:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 32DD440104E; Wed,  5 Apr 2023 10:36:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF41400F4F
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 10:36:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 117F48996E2
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 10:36:50 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-QA512lsxPMGXsidnr_7t7Q-1; Wed, 05 Apr 2023 06:36:48 -0400
X-MC-Unique: QA512lsxPMGXsidnr_7t7Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 a19-20020a05622a02d300b003e4ecb5f613so18590348qtx.21
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680691008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
 b=26F1imDzmGxqJnMbwRc3kwi2NN7o1rdNCkNaJCPMe0cs5pqLyTqpVjjaUjKdCJDS8K
 2XzlsneBQDxrx32/sQsY+PNM+tK5i8Qs02mvArJEfetSnST9mK4lMohthHtDX+UclYc2
 I3lAj9+x2RMnyeTP6roleyyQNl5KBgveTI9Gmqe0v3/Y+WWbx5PUmOTDtEA+x9i9gZ6/
 URs7O8MhtfmthVRJBXX9rxk9FU6O7kZ6djHL6UHBp0C95b7CFlXcKCXtJk63fCFTlfED
 fH+uGA+Fz+dOEVnmktBGd3tqoWZB1fxGQ0wXldg2j141QRAxtkX3okPhUKxouDHrz83u
 aiFQ==
X-Gm-Message-State: AAQBX9dvDxWR1u+/STUSymFIS7M2a4s4KEU/eXAA7NZelXUwBuuoPrkj
 KUTq0XOG6bXngPIrjc54HdIPO+oWcm09Ig3Zqq2MI0gNL6sIiclnmEzl9k0fPPFOhn+24egheE/
 onGhlUZu5Bt1L9AkiXs+9
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id
 t28-20020a05622a181c00b003daaa9b105amr4016626qtc.17.1680691008081; 
 Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yray4mqL/DA63FufP2W8G+Q2vCv/dEYqnAM/OkHjKwnv430c/AiUDk3FXiS3P6h8ilen17Eg==
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id
 t28-20020a05622a181c00b003daaa9b105amr4016592qtc.17.1680691007736; 
 Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 i2-20020ac84882000000b003d5aae2182dsm3911845qtq.29.2023.04.05.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:36:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230405103642.ykmgjgb7yi7htphf@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
 <ZCxCnC2lM9N9qtCc@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZCxCnC2lM9N9qtCc@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

On Tue, Apr 04, 2023 at 08:30:36AM -0700, Christoph Hellwig wrote:
> On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> > Not the whole folio always need to be verified by fs-verity (e.g.
> > with 1k blocks). Use passed folio's offset and size.
> 
> Why can't those callers just call fsverity_verify_blocks directly?
> 

They can. Calling _verify_folio with explicit offset; size appeared
more clear to me. But I'm ok with dropping this patch to have full
folio verify function.

-- 
- Andrey

