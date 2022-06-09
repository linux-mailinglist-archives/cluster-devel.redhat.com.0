Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D554445E
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jun 2022 08:58:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-fZ7kcZrBNnuHCGVWEnT0Ig-1; Thu, 09 Jun 2022 02:58:05 -0400
X-MC-Unique: fZ7kcZrBNnuHCGVWEnT0Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDEC63C01D92;
	Thu,  9 Jun 2022 06:58:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E32D2166B26;
	Thu,  9 Jun 2022 06:58:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D80B5194705B;
	Thu,  9 Jun 2022 06:58:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 98F4C1947040 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 03:53:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72E9F492CA3; Thu,  9 Jun 2022 03:53:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAD0492C3B
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 03:53:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 555723C0D196
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 03:53:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-e1uzBPACPxKI2ikwG33dTQ-1; Wed, 08 Jun 2022 23:53:06 -0400
X-MC-Unique: e1uzBPACPxKI2ikwG33dTQ-1
Received: by mail-pj1-f52.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so25579933pjl.4
 for <cluster-devel@redhat.com>; Wed, 08 Jun 2022 20:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=;
 b=lClHSKRr42CX9RIJCLWJQ/rbaREzYGpElnL6/RoGAs8HUfTQGwBHXNjKVG9xFOdQeO
 jdfTb8caj3tbMPfhlaJ0jObpvuW/epd1E0lhf4QtkWMBjIAZsq+3WrCmNkeG94MzP3I0
 x8IGtcVGEYMV/g6sw2pPe2xz37e9IHFQriTd06rQL9S2Zu1p0Bq7yr0OfD55AiaNYGhZ
 VN6raA0D98F2ajlgPhJHdwOUeaN3oaNDurh/BuTqxpS1SLBlAMqbKP73f1uIQXNdYK/C
 5iH8v7IYp2Pyh5dx1rqShbxJN4CSTEbV3cF4QinwfS2XK9oQe/+L1OVn03DNWqZrHu4X
 lpMg==
X-Gm-Message-State: AOAM533o9o7T/SsuQDnpNUSKgyPEAfgA1TCcKS3l850Ibife4slIbnkV
 +XpaHOsURLoMPpvs5wYrY7lA6A==
X-Google-Smtp-Source: ABdhPJz3/PMx3RZgt3QHHTiA/K9+ZXI01CeV4NC4DLpNFuQQZTFyqHCu1obpFa9lx3Ct5QRSUsQXvQ==
X-Received: by 2002:a17:902:e748:b0:164:1b1e:28fe with SMTP id
 p8-20020a170902e74800b001641b1e28femr38251973plf.116.1654746785210; 
 Wed, 08 Jun 2022 20:53:05 -0700 (PDT)
Received: from localhost ([139.177.225.238]) by smtp.gmail.com with ESMTPSA id
 a20-20020a170902b59400b001664ce47e11sm12584649pls.210.2022.06.08.20.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:53:04 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:53:00 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YqFunLBBKbZN9uD9@FVFYT0MHHV2J>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-17-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20220608150249.3033815-17-willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 09 Jun 2022 06:58:03 +0000
Subject: Re: [Cluster-devel] [PATCH v2 16/19] hugetlb: Convert to
 migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 08, 2022 at 04:02:46PM +0100, Matthew Wilcox (Oracle) wrote:
> This involves converting migrate_huge_page_move_mapping().  We also need a
> folio variant of hugetlb_set_page_subpool(), but that's for a later patch.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

