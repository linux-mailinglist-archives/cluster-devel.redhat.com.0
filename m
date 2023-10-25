Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE97D6090
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Oct 2023 05:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698205336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RRWPW0Tmq4BzTIASOKohK9MzMNeD1MHxe0hCDD+OqzY=;
	b=Vi/7r9PJQ2UNXvIpAbYtcwDmEFkcrIvObovphVW3l8Cgel9heUgZ+eQ+QbyQxSZSshiocl
	/DkX2rRWV6v+39O07GYRofsvbyrAe3cYs9Hf4hUxMDJlhADIG5/fgzKSvbqYPnNHCR+wy6
	uKAPSy6xsN6OfU5P7cN+s4qm1fBAr9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-RGzpW_YzN7uqnCVKT5v5Zw-1; Tue, 24 Oct 2023 23:42:12 -0400
X-MC-Unique: RGzpW_YzN7uqnCVKT5v5Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CD12857F8C;
	Wed, 25 Oct 2023 03:42:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDDEE1C060B6;
	Wed, 25 Oct 2023 03:42:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 621371946595;
	Wed, 25 Oct 2023 03:42:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A13AD1946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 25 Oct 2023 03:42:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59F52143; Wed, 25 Oct 2023 03:42:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52FBB134
 for <cluster-devel@redhat.com>; Wed, 25 Oct 2023 03:42:07 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BD513C0219A
 for <cluster-devel@redhat.com>; Wed, 25 Oct 2023 03:42:07 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-ysQuUJGoNWSL0nR8UmpJSQ-1; Tue,
 24 Oct 2023 23:42:04 -0400
X-MC-Unique: ysQuUJGoNWSL0nR8UmpJSQ-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvUSb-005F6T-0J; Wed, 25 Oct 2023 03:21:33 +0000
Date: Wed, 25 Oct 2023 04:21:33 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: syzbot <syzbot+3e5130844b0c0e2b4948@syzkaller.appspotmail.com>
Message-ID: <20231025032133.GA1247614@ZenIV>
References: <0000000000000c44b0060760bd00@google.com>
 <000000000000c92c0d06082091ee@google.com>
MIME-Version: 1.0
In-Reply-To: <000000000000c92c0d06082091ee@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] WARNING: suspicious RCU usage
 in gfs2_permission
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
Cc: gfs2@lists.linux.dev, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, postmaster@duagon.onmicrosoft.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: zeniv.linux.org.uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 20, 2023 at 12:10:38AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 0abd1557e21c617bd13fc18f7725fc6363c05913
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Mon Oct 2 02:33:44 2023 +0000
> 
>     gfs2: fix an oops in gfs2_permission
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10b21c33680000
> start commit:   2dac75696c6d Add linux-next specific files for 20231018
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12b21c33680000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14b21c33680000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6f8545e1ef7a2b66
> dashboard link: https://syzkaller.appspot.com/bug?extid=3e5130844b0c0e2b4948
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101c8d09680000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a07475680000
> 
> Reported-by: syzbot+3e5130844b0c0e2b4948@syzkaller.appspotmail.com
> Fixes: 0abd1557e21c ("gfs2: fix an oops in gfs2_permission")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Complaints about rcu_dereference() outside of rcu_read_lock().

We could replace that line with
	if (mask & MAY_NOT_BLOCK)
		gl = rcu_dereference(ip->i_gl);
	else
		gl = ip->i_gl;
or by any equivalent way to tell lockdep it ought to STFU.
BTW, the amount of rcu_dereference_protected(..., true) is somewhat depressing...

Probably need to turn
                ip->i_gl = NULL;
in the end of gfs2_evict_inode() into rcu_assign_pointer(ip->i_gl, NULL);
and transpose it with the previous line -
                gfs2_glock_put_eventually(ip->i_gl);

I don't think it really matters in this case, though - destruction of the object
it used to point to is delayed in all cases.  Matter of taste (and lockdep
false positives)...

