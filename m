Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF24F9788
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Apr 2022 16:02:20 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-KeQh0sC5O-GnWArgD3LiRw-1; Fri, 08 Apr 2022 10:02:18 -0400
X-MC-Unique: KeQh0sC5O-GnWArgD3LiRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C45DB3C01BAD;
	Fri,  8 Apr 2022 14:02:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFDC7145B989;
	Fri,  8 Apr 2022 14:02:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B38131940348;
	Fri,  8 Apr 2022 14:02:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61A261940341 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 14:02:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3BB5C111F3DB; Fri,  8 Apr 2022 14:02:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 376B6111F3D9
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 14:02:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 206F5185A7BA
 for <cluster-devel@redhat.com>; Fri,  8 Apr 2022 14:02:11 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-cxArauTvNdeKNubN34KXAg-1; Fri, 08 Apr 2022 10:02:08 -0400
X-MC-Unique: cxArauTvNdeKNubN34KXAg-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 33FF9215FD;
 Fri,  8 Apr 2022 14:02:06 +0000 (UTC)
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id C18F6A3B87;
 Fri,  8 Apr 2022 14:02:05 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 03176DA80E; Fri,  8 Apr 2022 15:58:02 +0200 (CEST)
Date: Fri, 8 Apr 2022 15:58:02 +0200
From: David Sterba <dsterba@suse.cz>
To: cgel.zte@gmail.com
Message-ID: <20220408135802.GQ15609@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, cgel.zte@gmail.com, dsterba@suse.com,
 tytso@mit.edu, clm@fb.com, josef@toxicpanda.com, sfrench@samba.org,
 matthew.garrett@nebula.com, jk@ozlabs.org, ardb@kernel.org,
 adilger.kernel@dilger.ca, rpeterso@redhat.com, agruenba@redhat.com,
 viro@zeniv.linux.org.uk, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20220408021136.2493147-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20220408021136.2493147-1-lv.ruyi@zte.com.cn>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v2] fs: remove unnecessary conditional
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
Reply-To: dsterba@suse.cz
Cc: linux-efi@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 ardb@kernel.org, matthew.garrett@nebula.com, Zeal Robot <zealci@zte.com.cn>,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 linux-cifs@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 tytso@mit.edu, Lv Ruyi <lv.ruyi@zte.com.cn>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, jk@ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2022 at 02:11:36AM +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> iput() has already handled null and non-null parameter, so it is no
> need to use if().
> 
> This patch remove all unnecessary conditional in fs subsystem.
> No functional changes.

You'd need to split i by subsystem under fs/, each subdirectory has a
differnt maintainer. I can take only the btrfs part.

