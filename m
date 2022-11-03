Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF5617725
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Nov 2022 08:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667459302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=;
	b=CjcMiteADCEWEfpd9Urg4rQIKvrSH2iAWgof/uYMypUE9AxQ0CACDgOYLDgedrC6mKfvpU
	tloUp4KREX3QfWvahWBuoKV2qYi8JtbKg5w6DqTtzkgKnje2UeQ9kp0zJCVC/sLJnNEEgQ
	mf/NTCanpf5oO3YQphSZsQChbKjMRmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-Pjlqk3hMOC2rWeDvjwTV7A-1; Thu, 03 Nov 2022 03:08:19 -0400
X-MC-Unique: Pjlqk3hMOC2rWeDvjwTV7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 512EC80280D;
	Thu,  3 Nov 2022 07:08:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1574940C2086;
	Thu,  3 Nov 2022 07:08:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C237B1946A46;
	Thu,  3 Nov 2022 07:08:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B900B1946594 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 07:08:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 963491415123; Thu,  3 Nov 2022 07:08:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5C21415117
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 07:08:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 268D43804515
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 07:08:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-q6wMpw0-NSqP5yIXtKPxMg-1; Thu, 03 Nov 2022 03:08:13 -0400
X-MC-Unique: q6wMpw0-NSqP5yIXtKPxMg-1
Received: by mail-pj1-f41.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso4357772pjg.5
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 00:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=;
 b=OKjo2CmPl3Q5PqSp0mSxz9SuiqPXvCcF/7W/HwsofkanSnvTYWrirLdiEgrIbbNa+2
 0+SA+wmrA8aLVOpQ7DtL0ThAFKhn4GPnmYSHwlXUFCLLH7dh4naUyT/roXiPTXO+6MWR
 GMgAWfYU/0yh1U4uwQUSqI+AqCYQnT7kq8c1Ip8ovFlpKlhf7YCAlpN0E84ejVGdjbrH
 ZEzXtBaEj5fGXpxbVHUC3Hep/nvsIRR7Pn7Jm+VRbCEc7qtPtgOlP2t3e5BbrA5SGkTC
 xyKpTntp2/BGQWBVck4/ZdGX2COU/ghPq925Yxi98AkP63x33n0ZQQeqE5XMkLPhve40
 PiqA==
X-Gm-Message-State: ACrzQf2BpmolhBHPs/m9j3W2bL/Tr6/QrWYYjbhmC4iZKkF0BnfIR3PF
 KYg+vbNmm8oex7ZWZuph98GlhQ==
X-Google-Smtp-Source: AMsMyM7EbTGuTativfwuYw+G5QrvaMpsSoYHAtMTN9boWfI/C7HSKjfDJIybcNCOqaRH/jY3hHhBSg==
X-Received: by 2002:a17:902:ed8e:b0:187:1c78:80c2 with SMTP id
 e14-20020a170902ed8e00b001871c7880c2mr21606400plj.38.1667459292279; 
 Thu, 03 Nov 2022 00:08:12 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b00179e1f08634sm9438901plp.222.2022.11.03.00.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 00:08:11 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqUKd-009gYz-VX; Thu, 03 Nov 2022 18:08:08 +1100
Date: Thu, 3 Nov 2022 18:08:07 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221103070807.GX2703033@dread.disaster.area>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v4 00/23] Convert to
 filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
> 
> F2fs and Ceph have quite a lot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
> 
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial. The page-writeback and filemap changes implicitly work. Testing
> and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.

Same question as last time: have you tested this with multipage
folios enabled? If you haven't tested XFS, then I'm guessing the
answer is no, and you haven't fixed the bug I pointed out in
the write_cache_pages() implementation....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

