Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DE618AF6
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Nov 2022 23:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667512816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=;
	b=NclSgITjA+VTxV/lMoEOyAJ8QQ8tJkS5zTbyRrksEjTc8GPuB67zkezag7XQ+6FngpTPG8
	q6wUyrqfr5P6MHti8+TxZ24p6PzOZ8Ijbtimk+CpRKbggIzJit+FaXoLJ1gibx4S6OHKOz
	44n5b1i2bfK5cigwKrq1YW0J5oYvmPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-pMbXj8MQMbCB3B_i-jt4JQ-1; Thu, 03 Nov 2022 18:00:09 -0400
X-MC-Unique: pMbXj8MQMbCB3B_i-jt4JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13771C07821;
	Thu,  3 Nov 2022 22:00:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85E4940C6EC3;
	Thu,  3 Nov 2022 22:00:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C7DA19465B2;
	Thu,  3 Nov 2022 22:00:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1111619465A4 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 22:00:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3BC640C6EE9; Thu,  3 Nov 2022 22:00:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEBF40C6EC3
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 22:00:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920ED8828C5
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 22:00:05 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-smUsKqAaMyqBxrMiTybL9g-1; Thu, 03 Nov 2022 17:59:59 -0400
X-MC-Unique: smUsKqAaMyqBxrMiTybL9g-1
Received: by mail-pj1-f49.google.com with SMTP id l6so2956488pjj.0;
 Thu, 03 Nov 2022 14:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXMtoJhRlFWaQLcxjEM+qd1+6PF53F0Hz+I5xM4y+wc=;
 b=lBROg4Dhdka+qgmiHZTsfBTGdqnArho1Yc7mT32BXiVY6YIk4CPYlxnoWpHs0esUmF
 uC84ayrBO5UCeq5FIDL7Xs5VRjIer6sb5QCoa7QcAGklQacd9e5rLtA2c5iW4Hd+YmBa
 U4PXGHpbusLudFhMY+l6H2jVbuQZUT6rfu1XzLuL+3nz+fnOvTd/GuRlSeexCAQWKUIF
 sVC5yNNE2OlI90nDT/SoXBDKqCTdWgNEI7tP8+ot2Pf53Tr6F+3xLXw2pzKN7qAJQfcR
 2JEv4/SCf3VVnozbAk43dDbHAD99ITB+ydLtnSHPSLMlALz5QDAqFUQeIdQCBECoa4OI
 I4cA==
X-Gm-Message-State: ACrzQf1udKl3saqWeFryG1qxwOZYfxqI/cmh5sIIuzhEfMsbjDw7Rvel
 yeZFgYzpd1sIMVsXTchiUQ4=
X-Google-Smtp-Source: AMsMyM7bULDdaNCNh0UvTT4e4bGiz6aC/rB81Sbmms9IVmh3til4gq09VVgLdxxc7KpN8RZNvnj8Zw==
X-Received: by 2002:a17:90b:1c10:b0:213:1bb8:feb with SMTP id
 oc16-20020a17090b1c1000b002131bb80febmr49947295pjb.214.1667512797631; 
 Thu, 03 Nov 2022 14:59:57 -0700 (PDT)
Received: from fedora ([2601:644:8002:1c20::8080])
 by smtp.gmail.com with ESMTPSA id
 123-20020a621781000000b00562784609fbsm1184991pfx.209.2022.11.03.14.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:59:57 -0700 (PDT)
Date: Thu, 3 Nov 2022 14:59:54 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2Q52uQGoqGM4o9m@fedora>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20221018214544.GI2703033@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20221018214544.GI2703033@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 00/23] Convert to
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 08:45:44AM +1100, Dave Chinner wrote:
> On Thu, Sep 01, 2022 at 03:01:15PM -0700, Vishal Moola (Oracle) wrote:
> > This patch series replaces find_get_pages_range_tag() with
> > filemap_get_folios_tag(). This also allows the removal of multiple
> > calls to compound_head() throughout.
> > It also makes a good chunk of the straightforward conversions to folios,
> > and takes the opportunity to introduce a function that grabs a folio
> > from the pagecache.
> > 
> > F2fs and Ceph have quite alot of work to be done regarding folios, so
> > for now those patches only have the changes necessary for the removal of
> > find_get_pages_range_tag(), and only support folios of size 1 (which is
> > all they use right now anyways).
> > 
> > I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> > beneficial.
> 
> Well, that answers my question about how filesystems that enable
> multi-page folios were tested: they weren't. 
> 
> I'd suggest that anyone working on further extending the
> filemap/folio infrastructure really needs to be testing XFS as a
> first priority, and then other filesystems as a secondary concern.
> 
> That's because XFS (via the fs/iomap infrastructure) is one of only
> 3 filesystems in the kernel (AFS and tmpfs are the others) that
> interact with the page cache and page cache "pages" solely via folio
> interfaces. As such they are able to support multi-page folios in
> the page cache. All of the tested filesystems still use the fixed
> PAGE_SIZE page interfaces to interact with the page cache, so they
> don't actually exercise interactions with multi-page folios at all.
> 

Thanks for the explanation! That makes perfect sense. I wholeheartedly
agree, and I'll be sure to test any future changes on XFS to try to
ensure multi-page folio functionality. 

I know David ran tests on AFS, so hopefully those hit multipage folios
well enough. But I'm not sure whether it was just for the AFS patch or
with the whole series applied. Regardless I'll run my own set of tests
on XFS and see if I run into any issues as well.

